require 'spec_helper'


describe "Pages" do

  describe "Home page" do

    it "should have the content 'Termz'" do
      visit '/pages/home'
      page.should have_content('Termz')
    end
  end


  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/pages/contact'
      page.should have_selector('title', :text => 'Contact')
    end

end

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit sign_up_path }

    it { should have_selector('title', text: 'Termz | Sign Up') }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('title', text: 'Termz | ' + user.name) }
  end


  describe "signup" do

    before { visit sign_up_path }

    let(:submit) { "Sign Up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in :name,         with: "Example User"
        fill_in :email,        with: "user2@example.com"
        fill_in :password,     with: "foobar"
        fill_in :password_confirmation, with: "foobar"
        # choose("user_locale_id_21")
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

end

end





end
