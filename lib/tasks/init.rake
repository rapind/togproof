namespace :grokphoto do

  desc "Initialize GrokPhoto"
  task :init do
    sh "cp ./config/database.yml.example ./config/database.yml"
    sh "cp ./config/heroku.yml.example ./config/heroku.yml"
    sh "cp ./config/initializers/devise.rb.example ./config/initializers/devise.rb"
    sh "cp ./config/initializers/secret_token.rb.example ./config/initializers/secret_token.rb"
    sh "cp ./config/initializers/session_store.rb.example ./config/initializers/session_store.rb"
  end

end