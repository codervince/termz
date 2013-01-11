require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    # sign_in @user
    #go to log in page, fill in the form and log in
    visit ( new_user_session_path)
    fill_in('Email', :with => 'test1@example.com')
    fill_in('Password', :with => 'foobar')
    click_button('Sign in')

    #also tests FactoryGirl has been set correctly to 

  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end
