puts "Creating photographer"
photographer = Photographer.create(
  :email => "photographer@grokphoto.org",
  :password => "password",
  :site_url => 'http://demo.grokphoto.org',
  :company_name => 'White Label Photography', 
  :company_email => 'info@grokphoto.org',
  :blog_url => 'http://blog.grokphoto.org',
  :facebook_url => 'http://www.facebook.com/pages/Toronto-ON/White-Label-Photography/208733155332',
  :use_watermark => false,
  :theme => 'minimal'
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
galleries << Gallery.create(:position => 1, :title => 'Maternity', :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.")
galleries << Gallery.create(:position => 2, :title => 'Newborn', :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis.")
galleries << Gallery.create(:position => 3, :title => 'Babies and Children', :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.")
galleries << Gallery.create(:position => 4, :title => 'Family', :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.")
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
  for file_name in file_names
    puts "uploading #{file_name}"
    gallery.gallery_photos.create(:image => File.new(file_name)) rescue nil
  end
end

puts "Creating pages"
pages = []
pages << Page.create(:position => 1, :title => 'About', :intro => 'Behind the lens.', :body => "h2. About me\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
pages << Page.create(:position => 2, :title => 'Rates', :intro => 'Session fees and print prices.', :body => "h2. Session Fees\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")

puts "Uploading page images"
base_dir = File.join(RAILS_ROOT, "photoshop/pages/")
for page in pages
  file_name = "#{page.title.downcase.gsub(' ', '-')}.jpg"
  file_path = "#{base_dir}#{file_name}"
  page.image = File.new(file_path) rescue nil
  page.save
end
