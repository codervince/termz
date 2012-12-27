class Authority < ActiveRecord::Base
  
  belongs_to :translations
  belongs_to :sources
end