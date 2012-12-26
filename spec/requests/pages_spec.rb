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



end
