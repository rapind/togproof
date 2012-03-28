puts "Creating photographer"
p = Photographer.create(
  :name => 'Dave Rapin Photography',
  :email => 'dave@grokphoto.org',
  :password => 'password',
  :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  :blog_url => 'http://rapin.com',
  :twitter_url => 'http://twitter.com/#!/rapind',
  :google_analytics_key => 'UA-2450369-23',
  :time_zone => 'Eastern Time (US & Canada)'
)

puts "Creating galleries"
base_dir = Rails.root.join('creatives', 'galleries')
Gallery.create!(:name => 'Maternity', :cover => File.new(File.join(base_dir, 'maternity.jpg')))
Gallery.create!(:name => 'Newborn', :cover => File.new(File.join(base_dir, 'newborn.jpg')))
Gallery.create!(:name => 'Babies', :cover => File.new(File.join(base_dir, 'babies.jpg')))
Gallery.create!(:name => 'Families', :cover => File.new(File.join(base_dir, 'families.jpg')))

puts "Uploading gallery images"
Gallery.all.each do |gallery|
  dir = File.join(base_dir, gallery.name.parameterize)
  file_names = Dir.glob("#{dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading gallery photo: #{file_name}"
    begin
      gallery.photos.create!(:photo => File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end

puts "Creating private galleries"
PrivateGallery.create!(:name => 'Jane Smith Family Session', :expires_on => 1.week.from_now)
PrivateGallery.create!(:name => 'Sue Jones Newborn Session', :expires_on => 4.weeks.from_now)

puts "Uploading private gallery images"
base_dir = Rails.root.join('creatives', 'private_galleries')
PrivateGallery.all.each do |private_gallery|
  dir = File.join(base_dir, private_gallery.name.parameterize)
  file_names = Dir.glob("#{dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading private gallery photo: #{file_name}"
    begin
      private_gallery.photos.create!(:photo => File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end


puts "Creating pages"
Page.create(:name => "About", :image => File.new(Rails.root.join('creatives', 'pages', 'about.png')), :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Page.create(:name => "Pricing", :image => File.new(Rails.root.join('creatives', 'pages', 'about.png')), :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
