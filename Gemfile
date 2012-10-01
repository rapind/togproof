source 'http://rubygems.org'

gem 'rails', '3.2.3'


# Needed by heroku
gem 'thin'

# Javascript
gem 'json', '~> 1.6.4'
gem 'jquery-rails', '~> 1.0.14'

# Markup / templates
gem 'rdiscount', '~> 1.6.8'
gem 'haml', '~> 3.1.4'

# Authentication
gem 'devise', '~> 1.5.3'

# Responders
gem 'responders', '~> 0.9.1'

# Ordering
gem 'acts_as_list', '~> 0.1.4'

# Forms - TODO: Switch to a stable gem once the wrapper stuff is released.
gem 'simple_form', '~> 2.0.2'

# Image uploads
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~> 0.9.11'
gem 'fog', '~> 0.10.0'

# Paging
gem 'kaminari', '~> 0.13.0'

# Caching
gem 'dalli', '~> 1.1.4'

# Monitoring
gem 'newrelic_rpm', '~> 3.3.1'

# Scaling
gem 'daemons', '~> 1.1.5'
gem 'delayed_job', '~> 3.0.0'
gem 'delayed_job_active_record', '~> 0.3.1'
gem 'hirefireapp', '~> 0.0.5'

# Factory
gem 'factory_girl_rails', '~> 1.1.0'

# Gems used only for assets and not required
# In production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'execjs', '1.3.0' # Remove once execjs v1.3.2 or 1.3.1.1
end

group :development, :test do
  # Database
  gem 'sqlite3', '~> 1.3.5'

  # Rspec
  gem 'rspec-rails', '~> 2.7.0'
end

group :development do
  # Heroku
  gem 'heroku'
  gem 'heroku_san', '~> 1.2.3'

  # Generators
  gem 'haml-rails', '~> 0.3.4'

  # Model schema
  gem 'annotate', :git => 'git://github.com/jeremyolliver/annotate_models.git', :branch => 'rake_compatibility'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false

  # Shoulda
  gem 'shoulda', '~> 2.11.3'

  # Cleanup
  gem 'database_cleaner', '~> 0.7.0'
end

group :production do
  # Database
  gem 'pg'
end