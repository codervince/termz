class Domain < ActiveRecord::Base
  attr_accessible :code, :image_url, :name


  # a translation has one domain (but same sc tc with different domain is a different translation!)



end
