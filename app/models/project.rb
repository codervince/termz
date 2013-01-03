# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  source_lang_id :integer
#  access_token   :string(255)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Project < ActiveRecord::Base

  attr_accessible :name, :source_lang_id

  before_save :generate_access_token


  validates :user_id, presence: true

  has_many :translations
  
  #has own owner, ultimately may have several users attached to the project
  belongs_to :user

  belongs_to :source_lang, :class_name => 'Language'


  default_scope order: 'projects.created_at DESC' 


	private
  
     def generate_access_token
       #also handles duplicates, self because refers to group not instance var
       begin
         self.access_token = SecureRandom.urlsafe_base64(5)
       end while self.class.exists?(access_token: access_token)
    end



end
