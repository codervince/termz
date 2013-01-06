#!/bin/env ruby
# encoding: utf-8

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  	Rake::Task['db:reset'].invoke
    make_users
    make_projects
    make_sources
  end

 # desc "Loads initial data needed by application."
 #  	task :populate => :environment do
  			
 #  	require 'active_record/fixtures'
 #  		Dir.glob(Rails.root + '/db/fixtures/*.yml').each do |file|
 #  			base_name = File.basename(file, '.*')
 #  			ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/db/fixtures", base_name)
 #  		end
 #  	end	

end



def make_users

[User, Translation, Language, Domain].each(&:delete_all)	

#speciic names
user1 = User.create!(
    :email => "publicvince102@gmail.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 26,        #en us
    :name => "Coder Vince"
    )

User.create!(
    :email => "fakeemail@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 1000,        #un
    :name => "Kofi Anan"            
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
    :name => "الكأس".encode('utf-8', :invalid => :replace, :undef => :replace)            
    )

User.create!(
    :email => "test2@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 8,
    :name => "ジミヘン".encode('utf-8', :invalid => :replace, :undef => :replace)
    ) 

User.create!(
    :email => "test3@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 9,
    :name => "Александр".encode('utf-8', :invalid => :replace, :undef => :replace)
    )

User.create!(
    :email => "test4@example.com",
    :password => "admin",
    :password_confirmation => "admin",
    :locale_id => 1,			#fr-ca
    :name => "Françoise".encode('utf-8', :invalid => :replace, :undef => :replace)            
    )


#random filler names
99.times do |n|
	name = Faker::Name.name
	email = Faker::Internet.email
    password  = "password"
    locale_id = (1..26).to_a.sample.to_i

    User.create!(
    :name => name,
    :email => email,
    :password => password,
    :password_confirmation => password,
    :locale_id => locale_id
    )
end
end


def make_projects

#  name           :string(255)
#  source_lang_id :integer
#  access_token   :string(255)		generated automatically


	users = User.limit(10).order("created_at ASC")
	5.times do
		name = Faker::Name.name
		source_lang_id = (1..26).to_a.sample.to_i

		users.each { |user| user.projects.create!(name: name, source_lang_id: source_lang_id) }
	end	


end	

def make_sources


Source.create!(
    :url => "GOOGLE SEARCH"
    )

Source.create!(
    :url => "OWN RESOURCES"
    )

end





