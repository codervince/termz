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

require 'spec_helper'

describe User do
 
 
  before(:each) do
    @attr = {
      :name => "Example User",
      :email => "test1@example.com",
      :password => "foobar",
      :password_confirmation => "foobar",
      :set_language_id => 1
    }
  end

  it { should respond_to(:name) }
  it { should respond_to(:email) }
 
 # it { should respond_to(:remember_token) }   
 # it { should respond_to(:password_digest) } 


  # it { should respond_to(:authenticate) }



 it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end 

  it "should require a name" do
    no_email_user = User.new(@attr.merge(:name => ""))
    no_email_user.should_not be_valid
  end 

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject names which are too long" do
    long = "a" * 26 
    invalid_name_user = User.new(@attr.merge(:name => long ))
    invalid_name_user.should_not be_valid

  end

  it "should reject passwords which are too short" do
    short = "b"*4 
    invalid_pwd_user = User.new(@attr.merge(:password => short, :password_confirmation => short ))
    invalid_pwd_user.should_not be_valid
  end

#it should reject dictionary passwords

describe "passwords" do

    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should require a password that is not blank" do 
      password = " "
      User.new(@attr.merge(:password => password, :password_confirmation => password)).
        should_not be_valid
     end 

    it "should require that the password confirmation is not nil" do
      User.new(@attr.merge(:password_confirmation => nil)).
        should_not be_valid
    end 


 end   

describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end

  end









# #TEST FOR AUTHENTICATE?
# describe "return value of authenticate method" do
#     before { @user.save }
#     let(:found_user) { User.find_by_email(@user.email) }

#     describe "with valid password" do
#       it { should == found_user.authenticate(@user.password) }
#     end

#     describe "with invalid password" do
#       let(:user_for_invalid_password) { found_user.authenticate("invalid") }

#       it { should_not == user_for_invalid_password }
#       # //specify is a syn for it
#       specify { user_for_invalid_password.should be_false }
#     end
#   end



describe "project associations" do


    before(:each) do
      @user = User.create!(@attr)
    end

   
    it "should have a projects attribute" do
       @user.should respond_to(:projects)
    end

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
