class Project < ActiveRecord::Base
  attr_accessible :access_token, :name, :owner_id, :source_lang_id
end
