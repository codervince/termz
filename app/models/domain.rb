# == Schema Information
#
# Table name: domains
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  code      :string(255)
#  image_url :string(255)
#  ancestry  :string(255)
#

class Domain < ActiveRecord::Base
  attr_accessible :code, :image_url, :name

  has_ancestry	
  # a translation has one domain (but same sc tc with different domain is a different translation!)
  belongs_to :translation


end
