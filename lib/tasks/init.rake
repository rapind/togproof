namespace :grokphoto do

  desc "Initialize GrokPhoto"
  task :init do
    sh "git submodule update --init"
  end

end