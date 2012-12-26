class Approval < ActiveRecord::Base
  attr_accessible :name, :ranking


  has_many :translations
end
