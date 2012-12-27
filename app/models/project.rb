# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  source_lang_id :integer
#  access_token   :string(255)
#  owner_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :access_token, :name, :owner_id, :source_lang_id


  has_many :translations
  
  #has own owner, ultimately may have several users attached to the project
  belongs_to :owner, :class_name => 'User'

  has_one :source_lang, :class_name => 'Language'



end
