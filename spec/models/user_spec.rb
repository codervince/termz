# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_hash   :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  guest           :boolean
#  locale_id       :integer
#  name            :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do
 
 #before block gets run before each example
  before { @user = User.new(            name: "Example User", 
                                        email: "user@example.com", 
                                        locale_id: 1, 
                                        password: "admin", 
                                        password_confirmation: "admin") }

  #this user is the defautl for the test case
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
   it { should respond_to(:password_confirmation) } 
  it { should respond_to(:remember_token) }   
 it { should respond_to(:password_digest) } 
  #testing user associations
  it { should respond_to(:projects) }


  it { should respond_to(:authenticate) }
 




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
describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      # //specify is a syn for it
      specify { user_for_invalid_password.should be_false }
    end
  end



describe "project associations" do

    before { @user.save }

    #return projects in order of most recent first
    let!(:older_project) do 
      FactoryGirl.create(:project, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_project) do
      FactoryGirl.create(:project, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right microposts in the right order" do
        @user.projects.should == [newer_project, older_project]
    end
    
    it "should destroy associated projects" do
      #projects get destroyed when users are destroyed [translations go into the public domain!]
      #deep copy
      projects = @user.projects.dup
      @user.destroy
      projects.should_not be_empty
      projects.each do |project|
        Project.find_by_id(project.id).should be_nil
      end
    end
  end


  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

end
