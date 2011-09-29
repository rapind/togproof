puts "Creating photographer"
p = Photographer.create(
  :name => 'GrokPhoto',
  :email => "photographer@grokphoto.org",
  :password => "password",
  :password_confirmation => "password",
  :blog_url => 'http://rapin.com',
  :twitter_url => 'http://twitter.com/#!/rapind',
  :google_analytics_key => 'UA-2450369-23'
)

puts "Creating portfolios"
base_dir = Rails.root.join('creatives', 'portfolios')
Portfolio.create!(:position => 1, :title => 'Newborn', :cover => File.new(File.join(base_dir, 'newborn.jpg')), :keywords => "professional, photography, portfolio, photo, client, workflow, management, gallery, ruby, rails", :description => "You can create galleries for your clients, upload multiple photos to a gallery with one click, and then send out a custom invite message giving your client secure access.")
Portfolio.create!(:position => 2, :title => 'Babies', :cover => File.new(File.join(base_dir, 'babies.jpg')), :keywords => "themes, professional, photography, portfolio, photo, client, workflow, management, gallery, ruby, rails", :description => "You can create your own themes. All you need is a little HTML knowledge, or even better some Ruby on Rails experience to create more advanced themes.")
Portfolio.create!(:position => 3, :title => 'Maternity', :cover => File.new(File.join(base_dir, 'maternity.jpg')), :keywords => "opensource, professional, photography, portfolio, photo, client, workflow, management, gallery, ruby, rails", :description => "GrokPhoto is completely open-source. This means if you know a little bit about coding (or someone who does), you can have your own version and theme up and running within a few minutes. The engine behind GrokPhoto is Ruby on Rails.")
Portfolio.create!(:position => 4, :title => 'Family', :cover => File.new(File.join(base_dir, 'family.jpg')), :keywords => "portfolio, professional, photography, portfolio, photo, client, workflow, management, gallery, ruby, rails", :description => "GrokPhoto is an open-source professional photographer portfolio, client manager, gallery manager, and photo system. Add as many galleries and pages as you like to your site once it's been setup.")

# Uploading photos
Portfolio.all.each do |portfolio|
  photos_dir = File.join(base_dir, portfolio.title.parameterize)
  file_names = Dir.glob("#{photos_dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading portfolio photo: #{file_name}"
    begin
      portfolio.portfolio_photos.create!(:position => (idx + 1), :photo => File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end

puts "Creating pages"
base_dir = Rails.root.join('creatives', 'pages')
Page.create!(:position => 1, :title => 'About', :image => File.new(File.join(base_dir, "about.png")), :summary => "So what's it all about?", :keywords => "about, story, ruby, rails, photography, professional, custom, page management, wiki, markdown, opensource", :body => "The Story\n---------\n\nI needed to build a professional photography site for a friend along with a way for her to easily manage clients, galleries, and photos.\n\nWhile there are plenty of open source galleries out there, most are written in PHP whereas my personal preference is Ruby on Rails. Also, I was unable to find any that supported the more advanced features we needed for managing client photos and workflow.\n\nAnd so grokphoto was born.\n\nYou can access the admin area at:\n\n* [http://www.grokphoto.org/admin](http://www.grokphoto.org/admin)\n* Email: photographer@grokphoto.org\n* Password: password\n\nYou can access the client area at:\n\n* [http://www.grokphoto.org/client](http://www.grokphoto.org/client)\n* Email: client@grokphoto.org\n* Password: password")
Page.create!(:position => 2, :title => 'Opensource', :image => File.new(File.join(base_dir, "opensource.png")), :summary => 'GrokPhoto is free!', :keywords => "opensource, ruby, rails, photography, git, haml, ajax, jquery, themes, erb", :body => "Get the Source\n-----------\n\n[http://github.com/rapind/grokphoto](http://github.com/rapind/grokphoto)\n\nFrom Wikipedia\n------------\n\nOpen-source software (OSS) is computer software for which the source code and certain other rights normally reserved for copyright holders are provided under a software license that meets the Open Source Definition or that is in the public domain. This permits users to use, change, and improve the software, and to redistribute it in modified or unmodified forms. It is very often developed in a public, collaborative manner. Open-source software is the most prominent example of open-source development and often compared to user-generated content. The term open-source software originated as part of a marketing campaign for free software. A report by Standish Group states that adoption of open-source software models has resulted in savings of about $60 billion per year to consumers.\n\n[http://en.wikipedia.org/wiki/Open_source_software](http://en.wikipedia.org/wiki/Open_source_software)")

puts "Creating galleries"
Gallery.create!(:title => 'Family Session', :expires_on => 1.week.ago)
gallery = Gallery.create!(:title => 'Newborn Session', :expires_on => 4.weeks.from_now)

puts "Uploading gallery images"
base_dir = Rails.root.join('creatives', 'galleries')
file_names = Dir.glob("#{base_dir}/*.jpg")
gallery = Gallery.first
file_names.each_with_index do |file_name, idx|
  puts "Uploading gallery photo: #{file_name}"
  begin
    gallery.gallery_photos.create!(:photo => File.new(file_name))
  rescue Exception => e
    puts e.message
  end
end