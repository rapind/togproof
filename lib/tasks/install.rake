require 'fileutils'

namespace :grokphoto do
  
  desc "Install grokphoto"
  task :install => :environment do
    file_names = []
    
    puts "Enter a name for your application:"
    app_name = $stdin.gets.chomp.gsub(" ", "-")
    
    puts "Enter your database user (default is root):"
    db_user = $stdin.gets.chomp.gsub(" ", "-") ||= 'root'
    
    puts "Enter your database password (default is ''):"
    db_password = $stdin.gets.chomp.gsub(" ", "-") ||= ''
    
    overwrite = true
    if File.exists?(File.join(Rails.root, 'config', 'database.yml'))
      puts "Found an existing database.yml. Overwrite it? (y/n)"
      resp = $stdin.gets.chomp.downcase
      overwrite = false unless resp == 'y' or resp == 'yes'
    end
    
    if overwrite
      # copy database.yml.sample to database.yml
      FileUtils.cp(File.join(Rails.root, 'config', 'database.yml.sample'), File.join(Rails.root, 'config', 'database.yml.copy'))
      file_names << File.join(Rails.root, 'config', 'database.yml.copy')
    end
    
    overwrite = true
    if File.exists?(File.join(Rails.root, 'config', 'deploy.rb'))
      puts "Found an existing deploy.rb. Overwrite it? (y/n)"
      resp = $stdin.gets.chomp.downcase
      overwrite = false unless resp == 'y' or resp == 'yes'
    end
    if overwrite
      # copy deploy.rb.sample to deploy.rb
      FileUtils.cp(File.join(Rails.root, 'config', 'deploy.rb.sample'), File.join(Rails.root, 'config', 'deploy.rb.copy'))
      file_names << File.join(Rails.root, 'config', 'deploy.rb.copy')
    end
    
    overwrite = true
    if File.exists?(File.join(Rails.root, 'config', 'initializers', 'grokphoto.rb'))
      puts "Found an existing grokphoto.rb. Overwrite it? (y/n)"
      resp = $stdin.gets.chomp.downcase
      overwrite = false unless resp == 'y' or resp == 'yes'
    end
    if overwrite
      puts "Enter your gmail address (I.e. fred@gmail.com):"
      gmail_user = $stdin.gets.chomp.downcase
    
      puts "Enter your gmail password:"
      gmail_password = $stdin.gets.chomp.downcase
    
      # copy grokphoto.rb.sample to grokphoto.rb
      FileUtils.cp(File.join(Rails.root, 'config', 'initializers', 'grokphoto.rb.sample'), File.join(Rails.root, 'config', 'initializers', 'grokphoto.rb.copy'))
      file_names << File.join(Rails.root, 'config', 'initializers', 'grokphoto.rb.copy')
    end
    
    for file_name in file_names
      # open the sample file
      text = File.read(file_name)
      text.gsub!("database: grokphoto #TODO - change this to your database", "database: #{app_name}")
      text.gsub!("username: root #TODO - change this to your database username", "username: #{db_user}")
      text.gsub!("password: #TODO - change this to your database password", "password: #{db_password}")
      text.gsub!("", "")
      
      # open it up and replace existing strings
      
      # save the file
    end
    
  end
  
end