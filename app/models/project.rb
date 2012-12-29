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
  attr_accessible :access_token, :name, :source_lang_id

  validates :user_id, presence: true

  has_many :translations
  
  #has own owner, ultimately may have several users attached to the project
  belongs_to :user

  has_one :source_lang, :class_name => 'Language'


  default_scope order: 'projects.created_at DESC' 

end
