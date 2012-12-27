require 'spec_helper'

describe User do
 
 #before block gets run before each example
  before { @user = User.new(name: "Example User", email: "user@example.com", locale_id: 1, password: "admin", password_confirmation: "admin") }

  #this user is the defautl for the test case
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  #responds to @user.valid? 
  it { should be_valid }

  #test for presence
  describe "when name is not present" do
  	before { @user.name = " " }
  	it { should_not be_valid }
	end
  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
	end

  describe "when name is too long" do
    before { @user.name = "a" * 26 }
    it { should_not be_valid }
  end	

  describe "when password is too short" do
    before { @user.password = "a" * 4, @user.password_confirmation = "a" * 4 }
    it { should_not be_valid }
  end


  describe "when email format is invalid" do
# using example user above to check for duplicates and upper case before filter
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

describe "when email address is already taken" do
    before do
      # creates a duplicate user with the same attributes
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

describe "when email address is already taken (CASE SENSITIVE)" do
    before do
      # creates a duplicate user with the same attributes
      user_with_same_email = @user.dup
      addresses = %w[USER@EXAMPLE.COM USER@example.CoM user@EXAMPLE.com]
      addresses.each do |bad_add|
			user_with_same_email.email = bad_add
      		user_with_same_email.save
      		user_with_same_email.should_not be_valid
      	end
    end

  end

describe "when password is not present" do
  before { @user.password = @user.password_confirmation = " " }
  it { should_not be_valid }
end

describe "when password doesn't match confirmation" do
  before { @user.password_confirmation = "mismatch" }
  it { should_not be_valid }
end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end


#TEST FOR AUTHENTICATE?


end
