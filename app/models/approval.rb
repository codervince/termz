# == Schema Information
#
# Table name: approvals
#
#  id      :integer          not null, primary key
#  name    :string(255)
#  ranking :integer
#

class Approval < ActiveRecord::Base
  attr_accessible :name, :ranking


  has_many :translations
end
