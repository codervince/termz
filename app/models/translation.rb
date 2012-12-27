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
#

class Translation < ActiveRecord::Base
  attr_accessible :approval_id, :domain_id, :owner, :project, :source_content, :source_lang_id, :target_content, :target_lang_id

  validates_presence_of :source_content, :source_lang_id, :target_content, :target_lang_id, :domain_id

  #user
    belongs_to :owner, :class_name => 'User'

    belongs_to :source_lang, :class_name => 'Language'
     belongs_to :target_lang, :class_name => 'Language'

 	#project
 	belongs_to :project

 	belongs_to :approval
	belongs_to :domain

 	has_many :authorities
 	has_many :sources, :through => :authorities

end
