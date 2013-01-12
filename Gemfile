source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Heroku's web server
gem 'thin'

# Javascript
gem 'json', '~> 1.6'
gem 'jquery-rails', '~> 1.0'

# Markup / templates
gem 'rdiscount', '~> 1.6'
gem 'haml', '~> 3.1'

# Authentication
gem 'devise', '~> 1.5'

# Responders
gem 'responders', '~> 0.9'

# Ordering
gem 'acts_as_list', '~> 0.1'

# Forms - TODO: Switch to a stable gem once the wrapper stuff is released.
gem 'simple_form', '~> 2.0'

# Image uploads
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~> 0.9'
gem 'fog', '~> 0.1'

# Paging
gem 'kaminari'
gem 'kaminari-bootstrap'

# Caching
gem 'dalli', '~> 1.1'

# Monitoring
gem 'newrelic_rpm', '~> 3.4'

# Scaling
gem 'daemons'
gem 'delayed_job', '~> 3.0'
gem 'delayed_job_active_record', '~> 0.3'
gem 'hirefireapp'

# Factory
gem 'factory_girl_rails', '~> 1.7'

# Gems used only for assets and not required
# In production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0'
  gem 'execjs', '1.3' # Remove once execjs v1.3.2 or 1.3.1.1
end

group :development, :test do
  # Database
  gem 'sqlite3'

  # Rspec
  gem 'rspec-rails', '~> 2.7'
end

group :development do
  # Generators
  gem 'haml-rails', '~> 0.3'

  # Deploy (for environments other than heroku)
  gem 'capistrano'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8', :require => false

  # Shoulda
  gem 'shoulda', '~> 2.11'

  # Cleanup
  gem 'database_cleaner', '~> 0.8'
end

group :production do
  # Database
  gem 'pg'
end