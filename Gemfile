source 'http://rubygems.org'

gem 'rails', '3.1.0'
# gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'

# Temporarily include earlier rack to get rid of a ruby warning.
# See: http://stackoverflow.com/questions/7624661/rake-already-initialized-constant-warning
gem 'rack', '1.3.3'

# Javascript
gem 'json', '~> 1.6.1'
gem 'jquery-rails', '~> 1.0.14'

# markup / templates
gem 'rdiscount', '~> 1.6.8'
gem 'haml', '~> 3.1.3'

# authentication
gem 'devise', '~> 1.4.9'

# thin controllers
gem 'inherited_resources', '~> 1.3.0'
gem 'responders', '~> 0.6.4'
gem 'has_scope', '~> 0.5.1'

# forms
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

# paging
gem 'kaminari', '~> 0.12.4'

# Sorting
gem 'acts_as_list', '~> 0.1.2'

# image uploads
gem 'carrierwave', '~> 0.5.7'
gem 'fog', '~> 0.10.0'
gem 'mini_magick', '~> 3.3'

gem 'grokphoto-theme-default', :git => 'git://github.com/rapind/grokphoto-theme-default.git' # :path => 'vendor/gems/grokphoto-theme-default'

# Gems used only for assets and not required
# In production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.1.0'
  gem 'coffee-rails', '~> 3.1.0'
  gem 'uglifier', '~> 1.0.3'
end

group :development do
  # Generators
  gem 'haml-rails', '~> 0.3.4'

  # Heroku tasks
  gem 'heroku_san', '~> 1.2.3'
end

group :development, :test do
  # Database
  gem 'sqlite3', '~> 1.3.4'

  # Rspec
  gem 'rspec-rails', '~> 2.6.1'

  # Factory
  gem 'factory_girl_rails', '~> 1.1.0'
end

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false

  # Shoulda
  gem 'shoulda', '~> 2.11.3'

  # Integration
  gem 'capybara', '~> 1.0.1'

  # Faster tests
  gem 'spork', '~> 0.9.0.rc'

  # Cleanup
  gem 'database_cleaner', '~> 0.6.7'

  # automatic testing
  gem 'guard', '~> 0.6.2'
  gem 'guard-rspec', '~> 0.4.2'
  gem 'guard-spork', '~> 0.2.1'

  gem 'growl', '~> 1.0.3'
  gem 'rb-fsevent', '~> 0.4.3.1'
  gem 'libnotify', '~> 0.5.7'
end

group :production do
  # Database
  gem 'pg', '~> 0.11.0'
end