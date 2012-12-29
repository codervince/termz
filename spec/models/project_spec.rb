# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  source_lang_id :integer
#  access_token   :string(255)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Project do
  

	let(:user) { FactoryGirl.create(:user) }
  
  	before do
     	@project = user.projects.build(name: "Lorem ipsum")
  	end

  	subject { @project }

  	it { should respond_to(:name) }

  	it { should respond_to(:user_id) }

  	its(:user) { should == user }

  	#projects need users

  	it { should be_valid }

  	describe "when user_id is not present" do
    	before { @project.user_id = nil }
    	it { should_not be_valid }
  	end

  	describe "accessible attributes" do
    	
    	it "should not allow access to owner_id" do
      		expect do
        		Project.new(user_id: user)
      		end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    	end    
  	end


end
