source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'pg_search'

#text snippets
gem 'boom'

##LATER FOR GOOGLE OMNIAUTH
# gem 'omniauth-google-oauth2', :require => "omniauth-google-oauth2"

#for setting env variables passwords etc also generate install
gem 'figaro'

gem 'bootstrap-sass', '2.1'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'

gem 'jquery-rails'

gem 'simple_form'
gem 'annotate'

gem 'ancestry'
gem 'smarter_csv'

gem "devise", ">= 2.1.0"

#this was taken from HARTL 
group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
  gem 'guard-spork', '1.2.0'  
  gem 'spork', '0.9.2'
  gem "factory_girl_rails", ">= 3.3.0"
end


# gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'libv8', '~> 3.11.8'
  gem 'therubyracer'
  gem 'less-rails'
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'

# gem 'twitter-bootstrap-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

#this was taken from HARTL 
group :test do
  gem 'capybara', '1.1.2'
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'  
  # gem 'launchy', '2.1.0'
  gem 'rb-fsevent', '0.9.1', :require => false
  gem 'growl', '1.0.3'
  gem "email_spec", ">= 1.2.1"
  gem "launchy", ">= 2.1.0"
end



group :production do
  gem 'pg'
end

#replace with https://github.com/dhh/tolk

