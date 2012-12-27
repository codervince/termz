class User < ActiveRecord::Base

#In a production application we’d want to add more validation in the User model such as validations for the password length and the email format.

  attr_accessible :email, :password, :password_confirmation, :locale_id, :name

  attr_accessor :password, :password_confirmation

  before_save :encrypt_password
  before_save { |user| user.email = email.downcase }

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


 has_many :translations,  :foreign_key => "owner_id" 
 has_many :projects,  :foreign_key => "owner_id"


  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

def self.authenticate(email, password)
  user = find_by_email(email)
  if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    user
  else
    nil
  end
end

#guest access from #393

#   def self.new_guest
#     new { |u| u.guest = true }
#   end

# def name
#   guest ? "Guest" : name
# end




end
