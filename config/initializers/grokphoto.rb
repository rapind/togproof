# TODO - copy this file to /config/initializers/grokphoto.rb
# Then tweak the values to reflect your setup

# session store
# TODO - change your key and secret values
ActionController::Base.session = {
  :key         => '_lauranovara.com_session',
  :secret      => 'a0as9d8f7grtt655dg3j2l12k3j4h5yh5jjqk2ldod09ccvv7b7b6v55xa5attdtsugg7743h454h5666klnbbafor8f494uhpfin4894h94q38ghf570gf07489qrh774f43f'
}

# for Heroku ( but doesn't work )
#ActionController::Base.page_cache_directory = "#{RAILS_ROOT}/tmp/cache"

# paperclip / imagemagick 
# TODO - change this to where imagemagick is installed (which convert)
#Paperclip.options[:command_path] = "/usr/local/bin"
Paperclip.options[:command_path] = "/usr/bin"

# mailer
# TODO - change this to your host
ActionMailer::Base.default_url_options[:host] = "lauranovara.webbyapp.com"

# gmail smtp
# TODO - change the username and password to your gmail account settings
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true,
  :user_name => "novara.laura@gmail.com",
  :password => "lauratempura"
}

# memcache store - TODO uncomment this if you're using a memcache and change your namespace if you like
# ActionController::Base.cache_store = :mem_cache_store, "localhost", { :namespace => 'grokphoto' }
