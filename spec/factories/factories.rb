# FactoryGirl.reload

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User Name #{n}" }                         
    sequence(:email) { |n| "person-#{n}@example.com" } 
    locale_id 21      #koream
    password "foobar"
    password_confirmation "foobar"
  end


  factory :project do
  	name "Lorem ipsum"
  	association :user  
  end

end