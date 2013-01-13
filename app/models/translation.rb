# == Schema Information
#
# Table name: translations
#
#  id             :integer          not null, primary key
#  source_lang_id :integer
#  source_content :string(255)
#  target_lang_id :integer
#  target_content :string(255)
#  domain_id      :integer
#  owner_id       :integer
#  approval_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  project_id     :integer
#  is_public      :boolean          default(TRUE)
#  is_term        :boolean          default(TRUE)
#  source_id      :integer
#

class Translation < ActiveRecord::Base




Translation::ISO_3166_SEPARATOR = "-"

  attr_accessible :approval_id, :domain_id, :owner_id, :project_id, :source_content, :source_lang_id, :target_content, :target_lang_id, :source_id

  validates_presence_of :source_content, :source_lang_id, :target_content, :target_lang_id, :domain_id

  #user
    belongs_to :owner, :class_name => 'User'

    belongs_to :source_lang, :class_name => 'Language'
     belongs_to :target_lang, :class_name => 'Language'

 	#project
 	belongs_to :project

 	belongs_to :approval
	belongs_to :domain

 	belongs_to :source

 	def self.set_ids(user, project)
 		@current_user = user
 		@current_project = project
 	end



 	def self.import(file)
 		#MAKE SURE LANGUAGES UP TO DATE

 		logger = Logger.new('importlog.log')

 		### DO DATABASE RAKE TASK TO SET UP LANGUAGES + DOMAINS FIRST!!!!!!!!!


 		###
 		#MAKE THIS A GEM IMPORTTERMZCSV?
 		###deal with variations in headers deDE enUS etc
 		###deal with 3 digit ISO CODES
 		### What if DOMAIN NAME IN FILE NAME IS NOT IN DB??


 		###
 		# GET CURRENT USER AND PROJECT ID WHEN FORM IS UPLOADED (IN IMPORT CONTROLLER ACTION??)


 		#CSV has headers: source_lang, target_language, source
 		#Take source_language look up id in Language table and assign to source_lang_id and same for target
 		#source is ; delimited.. add to Source iD 
 		# finally go to Associates table add new Translation ID to source ID
 		case File.extname(file.original_filename)
 		when ".csv"
 			#get header information as array 
 			#file.path
 			header_flds = CSV.read(file.path)[0]
 			if header_flds.count == 3
 				#TODO: try to find by iso code otherwise default to id 1000 'un' to id 1000 'un' 
 				begin
 					source_lang_id = Language.find_by_iso_code(correct_iso(header_flds[0])).id 
 					target_lang_id = Language.find_by_iso_code(correct_iso(header_flds[1])).id
 				rescue Exception => e
 					logger.error "Incorrect headers/ISO Code not in database: #{e}" + "  " + Time.now

 				end	
 			end	
 			#rtns array of hashes with new 
 			#domain based on filename format DOMAIN_
 				domain_code = get_domain_code(file.original_filename) 			
 				domain_id = Domain.find_by_code(domain_code).id


 				trans = SmarterCSV.process(file.path, :user_provided_headers => [:source_content, :target_content, :url]) do |arr|
 								#TODO: do not create source if blank url 
 								source_id = Source.create(arr.first.slice(:url)).id if arr.first.has_value?(:url)
 								trans_id = Translation.create(
 											arr.first.slice(:source_content, :target_content).merge(
 												{  :source_lang_id => source_lang_id, 
 												   :target_lang_id => target_lang_id, 
 												   :domain_id => domain_id,
 												   :source_id => source_id,
 												   :owner_id => @current_user.id,
 												   :project_id => @current_project.id
 												}	
 												)).id

 								
 								
 				 end
 	

		
 			#for console work:
 			# trans = SmarterCSV.process('tmp/LIEBHERR.csv', :user_provided_headers => [:source_content, :target_content, :source]) do |arr| puts arr.first.slice(:source).inspect end	
 			# trans = SmarterCSV.process('tmp/LIEBHERR.csv', :user_provided_headers => [:source_content, :target_content, :url]) do |arr| Source.create( arr.first.slice(:url)) end
 		else #for case block
 			raise "Unknown file type: #{file.original_filename}"	
 		end	

 	end 	


 	#should take an input which can DE de-AT de_At deCH (and all cases) and returns ISO code.
 	#PREREQUISITE - standard codes de-de or de must be in Domains table
 	#RETURNS - The iso-code which is in the table as a string, either 5 digit XX-XX or 2 digit XX 
 	def self.correct_iso(field)
 		case field.size
 		when 5
 			if ["-", "_"].include?(field[2])
				field[2] = ISO_3166_SEPARATOR
 			 	return field.downcase
 			else
 				raise "Formatting error"
 			end 
 		when 4
 			#does field only consist of \ws? if so add a "_"
 			if field.scan(/\w+/).include?(field)
 				field.insert(2, ISO_3166_SEPARATOR)
 				return field.downcase
 			else 
 				raise "Formatting Error"
 			end  	
 		when 2
 			# ISO 639-1
 			if field.scan(/\w+/).include?(field)
 				return field.downcase
 			else
 				raise "Formatting Error"
 			end	
 		end	
 	end	

 	#  ISO 3166:1993  four letter
 	# ISO 639-1  two letter
 	def self.get_domain_code(filename)
 		#filename must have an underscore starts with domain as one word
 		if filename.include?("_")
 			#looks for first _
 			return filename.slice(0, filename.index('_') ).upcase
 		else
 			raise "Domain error"
 		end		
 	end


 	## SEARCH FEATURES

 	def self.search(term)
    	where("source_content like :term", term: "%#{term}%")
  	end


 	
end
