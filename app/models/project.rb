class Project < ActiveRecord::Base
  attr_accessible :access_token, :name, :owner_id, :source_lang_id


  has_many :translations

  has_one :source_lang, :class_name => 'Language'



end
