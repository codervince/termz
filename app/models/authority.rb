class Authority < ActiveRecord::Base
  attr_accessible :source_id, :translation_id

  belongs_to :translation
  belongs_to :source


end
