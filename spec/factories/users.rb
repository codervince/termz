# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
    
    factory :user do
    sequence(:name) { |n| "User Name #{n}" }                         
    sequence(:email) { |n| "person-#{n}@example.com" } 
    set_language_id 21      #koream
    password "foobar"
    password_confirmation "foobar"
  end

end
