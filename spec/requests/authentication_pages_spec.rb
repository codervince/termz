require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "login page" do
    before { visit log_in_path }

    it { should have_selector('h1',    text: 'Log In') }
    it { should have_selector('title', text: 'Log In') }
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
      end
  end

end
