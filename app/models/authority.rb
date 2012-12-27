# == Schema Information
#
# Table name: authorities
#
#  id             :integer          not null, primary key
#  translation_id :integer
#  source_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Authority < ActiveRecord::Base
  attr_accessible :source_id, :translation_id

  belongs_to :translation
  belongs_to :source


end
