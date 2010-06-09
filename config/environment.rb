# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.action_controller.session = { :key => "_lauranovara.com_session", :secret => "some secret phrase some secret phrase some secret phrase" }

  # moved to config/initializers/grokphoto.rb
  # config.action_controller.page_cache_directory = "#{RAILS_ROOT}/tmp/cache"

  # required gems (rake gems:install)
  config.gem 'rails', :version => "= 2.3.5"
  config.gem 'thin'

  # to run locally comment the next line
  config.gem 'pg', :version => "= 0.9.0"

  config.gem 'rdiscount'
  config.gem 'mime-types', :lib => 'mime/types', :version => "= 1.16"
  config.gem 'acts_as_list', :version => "= 0.1.2"

  # version 1.1.2 doesn' works
  # config.gem 'inherited_resources', :version => "= 1.1.2"
  config.gem 'inherited_resources', :version => "= 0.9.5"

  config.gem 'will_paginate'
  config.gem 'authlogic'
  config.gem 'haml'
  config.gem 'exifr'
  config.gem 'less', :version => "= 1.2.21"
  config.gem 'friendly_id'
  
  # TODO - change this to your time zone
  config.time_zone = 'Eastern Time (US & Canada)'
  
end
