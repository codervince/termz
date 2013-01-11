# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.reload
FactoryGirl.define do
    
    factory :user do
		    # sequence(:name) { |n| "User Name #{n}" }                         
		    # sequence(:email) { |n| "person-#{n}@example.com" }
		    name "Test User"
		    email "test1@example.com" 
		    set_language_id 21      #korean
		    password "foobar"
		    password_confirmation "foobar"
		    confirmed_at DateTime.now
  end

end
