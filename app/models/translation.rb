class Translation < ActiveRecord::Base
  attr_accessible :approval_id, :domain_id, :owner_id, :source_content, :source_lang_id, :target_content, :target_lang_id

  #user
    belongs_to :owner, :class_name => 'User'

    belongs_to :source_lang, :class_name => 'Language'

 	#project
 	belongs_to :project

 	belongs_to :approval

 	has_one :domain

 	has_many :authorities
 	has_many :sources, :through => :authorities

end
