source 'http://rubygems.org'

gem 'rails', '3.1.3'
# gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'

# Temporarily include earlier rack to get rid of a ruby warning.
# See: http://stackoverflow.com/questions/7624661/rake-already-initialized-constant-warning
# gem 'rack', '1.3.3'

# Javascript
gem 'json', '~> 1.6.3'
gem 'jquery-rails', '~> 1.0.19'

# Templates
gem 'haml', '~> 3.1.4'

# Authentication
gem 'devise', '~> 1.5.2'

# Thin controllers
gem 'inherited_resources', '~> 1.3.0'
gem 'has_scope', '~> 0.5.1'

# Forms
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

# Paging
gem 'kaminari', '~> 0.12.4'

# Sorting
gem 'acts_as_list', '~> 0.1.2'

# Image uploads
gem 'carrierwave', '~> 0.5.8'
gem 'fog', '~> 1.1.1'
gem 'mini_magick', '~> 3.3'

# Monitoring
gem 'newrelic_rpm', '~> 3.3.0'

# Scaling
gem 'hirefireapp', '~> 0.0.5'

# Factory
gem 'factory_girl_rails', '~> 1.4.0'

# Gems used only for assets and not required
# In production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '~> 1.2.0'
end

group :development do
  # Generators
  gem 'haml-rails', '~> 0.3.4'
end

group :development, :test do
  # Database
  gem 'sqlite3', '~> 1.3.5'

  # Rspec
  gem 'rspec-rails', '~> 2.7.0'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false

  # Shoulda
  gem 'shoulda', '~> 2.11.3'

  # Faster tests
  gem 'spork', '~> 0.9.0.rc'

  # Cleanup
  gem 'database_cleaner', '~> 0.7.0'
end

group :production do
  # Database
  gem 'pg', '~> 0.12.0'
end