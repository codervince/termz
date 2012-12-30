#needs user authentication done properly - specifically with log_in user.

# require 'spec_helper'

# describe "project pages" do

#   subject { page }

#   let(:user) { FactoryGirl.create(:user) }
#   before { log_in user }

#   describe "Project creation" do
#     before { visit user_path(:user) }

#     describe "with invalid information" do

#       it "should not create a Project" do
#         expect { click_button "Create Project" }.not_to change(Project, :count)
#       end

#       # describe "error messages" do
#       #   before { click_button "Create Project" }
#       #   it { should have_content('error') } 
#       # end
#     end

#     describe "with valid information" do

#       before { fill_in 'project_name', with: "Lorem ipsum" }
#       it "should create a Project" do
#         expect { click_button "Create Project" }.to change(Project, :count).by(1)
#       end
#     end
#   end
# end
