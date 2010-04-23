namespace :cache do
  desc 'Clear memcache'
  task :clear => :environment do
    ActionController::Base.cache_store.clear
  end
end