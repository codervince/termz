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


#users for different languages
#see sample_Data.rake


