require 'spork'
require 'database_cleaner'

ENV["RAILS_ENV"] ||= 'test'

Spork.prefork do
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  DatabaseCleaner.strategy = :truncation

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.include Devise::TestHelpers, :type => :controller
    config.include Capybara::DSL, :type => :request
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  DatabaseCleaner.clean
end