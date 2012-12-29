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
  attr_accessible :approval_id, :domain_id, :owner, :project, :source_content, :source_lang_id, :target_content, :target_lang_id, :source_id

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

 	## IMPROVE TO ADD owner_id and project_id
 	def self.import(file)

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
 				source_lang_id = Language.find_by_iso_code(correct_iso(header_flds[0])).id 
 				target_lang_id = Language.find_by_iso_code(correct_iso(header_flds[1])).id
 				# source_id = Source.find_or_create_by_url(header_flds[2]).id 	
 			else
 				raise "Please check formatting"
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
 												   :source_id => source_id
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

 	def self.correct_iso(field)
 		if field.size == 5
 			field[2] = "-"
 			return field
 		else field.size == 2
 			#basic ISO code
 			return field
 		end	
 	end	

 	def self.get_domain_code(filename)
 		#filename must have an underscore starts with domain as one word
 		if filename.include?("_")
 			#looks for first _
 			return filename.slice(0, filename.index('_') ).upcase
 		else
 			raise "Domain error"
 		end		
 	end	
 	
end
