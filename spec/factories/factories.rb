FactoryGirl.define do
  factory :user do
    name     "Vince Vincent"
    email    "vince@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end