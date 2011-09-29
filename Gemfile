source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'
# gem 'sprockets', :git => 'git://github.com/sstephenson/sprockets.git'

# database
gem 'sqlite3'

# javascript
gem 'json'
gem 'jquery-rails'

# markup / templates
gem 'rdiscount', '~> 1.6.8'
gem 'haml', '~> 3.1.2'

# authentication
gem 'devise', '~> 1.4.2'

# thin controllers
gem 'inherited_resources', '~> 1.2.2'
gem 'responders', '~> 0.6.4'
gem 'has_scope', '~> 0.5.1'

# forms
gem 'simple_form', '~> 1.4.2'

# paging
gem 'kaminari', '~> 0.12.4'

# Sorting
gem 'acts_as_list', '~> 0.1.2'

# image uploads
gem 'carrierwave', '~> 0.5.7'
gem 'fog', '~> 0.10.0'
gem 'mini_magick', '~> 3.3'

gem 'grokphoto-theme-default', :path => 'vendor/gems/grokphoto-theme-default'

group :development, :test do
  # generators
  gem 'haml-rails', '~> 0.3.4'

  gem 'rspec-rails', '~> 2.6.1'
  gem 'shoulda', '~> 2.11.3'
  gem 'capybara', '~> 1.0.1'
  gem 'factory_girl_rails', '~> 1.1.0'
  gem 'spork', '~> 0.9.0.rc'
  gem 'database_cleaner', '~> 0.6.7'

  gem 'guard', '~> 0.6.2'
  gem 'guard-rspec', '~> 0.4.2'
  gem 'guard-spork', '~> 0.2.1'

  if RUBY_PLATFORM =~ /darwin/
    # OSX
    gem 'rb-fsevent', '~> 0.4.3.1'
    gem 'growl_notify', '~> 0.0.1'
  elsif RUBY_PLATFORM =~ /linux/
    # Linux
    gem 'rb-inotify'
  end

  # heroku tasks
  gem 'heroku_san', '~> 1.2.3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', :git => 'https://github.com/rails/sass-rails.git', :branch => '3-1-stable'
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end