# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'active_record/fixtures'
Domain.delete_all
Language.delete_all
# languages will be from a language file?? #see ascii 179
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "languages")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/db/fixtures", "domains")
User.delete_all
Approval.delete_all
Translation.delete_all


#users for different languages


User.create!(
    :email => "publicvince102@gmail.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 26,        #en us
    :name => "Coder Vince"
    )

User.create!(
    :email => "publicvince101@gmail.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 1,        #de
    :name => "Klaus"            
    )

User.create!(
    :email => "test@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 13,           #ar-sa
    :name =>  "Arabic Name"           
    )

User.create!(
    :email => "test2@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 8,
    :name =>  "Japanese Name"           #jp
    )

User.create!(
    :email => "test3@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 9,
    :name =>  "Russian Name"           #ru
    )

User.create!(
    :email => "test4@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 19,
    :name =>  "French Canadian"           #fr-ca
    )

#creare some projects!!
#for each user create 2 projects




Source.create!(
    :url => "GOOGLE SEARCH"
    )

Source.create!(
    :url => "OWN RESOURCES"
    )
