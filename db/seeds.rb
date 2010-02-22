puts "Creating photographer"
photographer = Photographer.create(
  :email => "photographer@grokphoto.org",
  :password => "password",
  :site_url => 'http://demo.grokphoto.org',
  :company_name => 'Grokphoto', 
  :company_email => 'info@grokphoto.org',
  :blog_url => 'http://rapin.com',
  :use_watermark => false,
  :theme => 'default'
)
puts "Uploading watermark..."
photographer.watermark = File.new(File.join(RAILS_ROOT, "photoshop/watermark.png")) rescue nil
photographer.save

puts "Creating clients"
client = Client.create(:name => 'Demo Client', :email => "client@grokphoto.org", :password => "password")

puts "Creating bookings"
bookings = []
bookings << client.bookings.create(:title => 'Newborn Session', :occurs_on => 3.weeks.ago, :expires_on => 1.week.ago)
bookings << client.bookings.create(:title => 'Family Session', :occurs_on => 2.weeks.from_now, :expires_on => 4.weeks.from_now)

puts "Creating galleries"
galleries = []
galleries << Gallery.create(:position => 1, :title => 'Portfolio', :keywords => "portfolio, professional, photography, gallery, photo, client, workflow, management, booking, ruby, rails", :description => "Grokphoto is an opensource professional photographer gallery, client manager, booking manager, and photo system. Add as many galleries and pages as you like to your site once it's been setup.")
galleries << Gallery.create(:position => 2, :title => 'Client Mangement', :keywords => "professional, photography, gallery, photo, client, workflow, management, booking, ruby, rails", :description => "You can create bookings for your clients, upload multiple photos to a booking with one click, and then send out a custom invite message giving your client secure access.")
galleries << Gallery.create(:position => 3, :title => 'Themes', :keywords => "themes, professional, photography, gallery, photo, client, workflow, management, booking, ruby, rails", :description => "You can create your own themes. All you need is a little HTML knowledge, or even better some Ruby on Rails experience to create more advanced themes.")
galleries << Gallery.create(:position => 4, :title => 'Open Source', :keywords => "opensource, professional, photography, gallery, photo, client, workflow, management, booking, ruby, rails", :description => "Grokphoto is completely opensource. This means if you know a little bit about coding (or someone who does), you can have your own version and theme up and running within a few minutes. The engine behind Grokphoto is Ruby on Rails.")
puts "Uploading gallery images..."
base_dir = File.join(RAILS_ROOT, "photoshop/galleries/")
for gallery in galleries
  file_name = "#{gallery.title.downcase.gsub(' ', '-')}.jpg"
  file_path = "#{base_dir}#{file_name}"
  gallery.image = File.new(file_path) rescue nil
  gallery.save
end

puts "Uploading gallery photo images"
base_dir = File.join(RAILS_ROOT, "photoshop/galleries")
for gallery in galleries
  photos_dir = File.join(RAILS_ROOT, "photoshop/galleries/#{gallery.title.downcase.gsub(' ', '-')}/")
  file_names = Dir.glob("#{photos_dir}*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "uploading #{file_name}"
    gallery.gallery_photos.create(:position => (idx + 1), :image => File.new(file_name)) rescue nil
  end
end

puts "Creating pages"
pages = []
pages << Page.create(:position => 1, :title => 'About', :intro => "So what's it all about?", :keywords => "about, story, ruby, rails, photography, professional, custom, page management, wiki, markdown, opensource", :body => "The Story\n---------\n\nI needed to build a professional photography site for a friend along with a way for her to easily manage clients, bookings, and photos.\n\nWhile there are plenty of open source galleries out there, most are written in PHP whereas my personal preference is Ruby on Rails. Also, I was unable to find any that supported the more advanced features we needed for managing client photos and workflow.\n\nAnd so grokphoto was born.\n\nYou can access the admin area at:\n\n* [http://www.grokphoto.org/admin](http://www.grokphoto.org/admin)\n* Email: photographer@grokphoto.org\n* Password: password\n\nYou can access the client area at:\n\n* [http://www.grokphoto.org/client](http://www.grokphoto.org/client)\n* Email: client@grokphoto.org\n* Password: password")
pages << Page.create(:position => 2, :title => 'Opensource', :intro => 'Grokphoto is free!', :keywords => "opensource, ruby, rails, photography, git, haml, ajax, jquery, themes, erb", :body => "Get the Source\n-----------\n\n[http://github.com/rapind/grokphoto](http://github.com/rapind/grokphoto)\n\nFrom Wikipedia\n------------\n\nOpen-source software (OSS) is computer software for which the source code and certain other rights normally reserved for copyright holders are provided under a software license that meets the Open Source Definition or that is in the public domain. This permits users to use, change, and improve the software, and to redistribute it in modified or unmodified forms. It is very often developed in a public, collaborative manner. Open-source software is the most prominent example of open-source development and often compared to user-generated content. The term open-source software originated as part of a marketing campaign for free software. A report by Standish Group states that adoption of open-source software models has resulted in savings of about $60 billion per year to consumers.\n\n[http://en.wikipedia.org/wiki/Open_source_software](http://en.wikipedia.org/wiki/Open_source_software)")

puts "Uploading page images"
base_dir = File.join(RAILS_ROOT, "photoshop/pages/")
for page in pages
  file_name = "#{page.title.downcase.gsub(' ', '-')}.jpg"
  file_path = "#{base_dir}#{file_name}"
  page.image = File.new(file_path) rescue nil
  page.save
end

puts "Creating quotes"
Quote.create(:position => 1, :author => 'Dave Rapin - Toronto', :body => "If I had some testimonials, this is where they'd go!")
