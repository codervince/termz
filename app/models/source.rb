# == Schema Information
#
# Table name: sources
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Source < ActiveRecord::Base
  attr_accessible :url

   has_many :translations



end
