require 'spork'
require 'database_cleaner'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  DatabaseCleaner.strategy = :truncation

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.include Devise::TestHelpers, :type => :controller
    config.before(:all) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.start
    end
    config.after(:all) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
end