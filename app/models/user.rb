class User < ActiveRecord::Base

#In a production application we’d want to add more validation in the User model such as validations for the password length and the email format.

  attr_accessible :email, :password, :password_confirmation, :locale_id, :name


  attr_accessor :password

  before_save :encrypt_password


  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


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



end
