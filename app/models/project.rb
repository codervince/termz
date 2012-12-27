class Project < ActiveRecord::Base
  attr_accessible :access_token, :name, :owner_id, :source_lang_id


  has_many :translations
  
  #has own owner, ultimately may have several users attached to the project
  belongs_to :owner, :class_name => 'User'

  has_one :source_lang, :class_name => 'Language'



end
