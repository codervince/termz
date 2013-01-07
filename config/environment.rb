# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Termz::Application.initialize!

#tabs and spaces
require 'yaml'

YAML::ENGINE.yamler = 'syck'
