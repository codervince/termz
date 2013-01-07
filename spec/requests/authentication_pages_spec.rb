require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit log_in_path }

    it { should have_selector('h1',    text: 'Log In') }
    it { should have_selector('title', text: 'Log In') }
  end

  describe "authorization" do

    describe "for non-signed-in users" do


      let(:user) { FactoryGirl.create(:user) }

      describe "in the Users controller" do

        describe "visiting the edit page (SETTINGS)" do
            before { visit edit_user_path(user) }
            it { should have_selector('title', text: 'Log In') }
        end

        describe "submitting to the update action (SETTINGS)" do
            before { put user_path(user) }
            specify { response.should redirect_to(log_in_path) }
        end

      end
    end
  
    #requiring right user to edit user settings - any malicious attempt goes to root page
    describe "as wrong user" do
        
        let(:user) { FactoryGirl.create(:user) }
        let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      
        before { log_in user }

        describe "visiting Users#edit page" do
          before { visit edit_user_path(wrong_user) }
          it { should_not have_selector('title', text: full_title('Edit User Settings')) }
        end

      describe "submitting a PUT request to the Users#update action" do
          before { put user_path(wrong_user) }
          specify { response.should redirect_to(root_path) }
      end
    end



  end 











 describe "login" do
    
      before { visit log_in_path }

    
      describe "with invalid information" do
        
          before { click_button "Log In" }

          it { should have_selector('h1', text: 'Log In') }
        it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      end

      describe "with valid information" do
        let(:user) { FactoryGirl.create(:user) }
        
        before do
          fill_in "session_email",    with: user.email
          fill_in "session_password", with: user.password
          click_button "Log In"
          end

          it { should have_link('Log Out', href: log_out_path) }
          it { should_not have_link('Log In', href: log_in_path) }
      end
  end

end
