# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  set_language_id        :integer
#  name                   :string(255)
#  remember_token         :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,:omniauthable LATER!
  # :lockable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :set_language_id, :name
  # attr_accessible :title, :body

## VALIDATIONS

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates     :name, :presence => true,
                :length => { :maximum => 25 }

  
  validates     :email, :presence => true,
                :format => { :with => VALID_EMAIL_REGEX },
                :length => { :maximum => 50 },
                :uniqueness => {:case_sensitive => true }

  #this also creates a virtual attr automatically called password_confirmation!!
  validates :password, :presence => true, :length => { minimum: 5 }, :on => :create, :confirmation => true
  validates :password_confirmation, :presence => true, :on => :create
  # validates_presence_of :password, :on => :create
  
  
 #end validations from 12

##ASSOCIATIONS

 has_many :translations,  :foreign_key => "owner_id"

 
 has_many :projects, dependent: :destroy

 belongs_to :set_language_id, :class_name => 'Language'





end
