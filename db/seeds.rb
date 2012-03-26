puts "Creating photographer"
p = Photographer.create(
  :name => 'Dave Rapin Photography',
  :email => 'dave@grokphoto.org',
  :password => 'password',
  :description => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
  :blog_url => 'http://rapin.com',
  :twitter_url => 'http://twitter.com/#!/rapind',
  :google_analytics_key => 'UA-2450369-23'
)

puts "Creating private galleries"
PrivateGallery.create!(:name => 'Family Session', :expires_on => 1.week.from_now)
private_gallery = PrivateGallery.create!(:name => 'Newborn Session', :expires_on => 4.weeks.from_now)

puts "Uploading private gallery images"
base_dir = Rails.root.join('creatives', 'galleries')
file_names = Dir.glob("#{base_dir}/*.jpg")
private_gallery = PrivateGallery.first
file_names.each_with_index do |file_name, idx|
  puts "Uploading private gallery photo: #{file_name}"
  begin
    private_gallery.photos.create!(:photo => File.new(file_name))
  rescue Exception => e
    puts e.message
  end
end

puts "Creating pages"
Page.create(:name => "About", :image => File.new(Rails.root.join('creatives', 'pages', 'about.png')), :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Page.create(:name => "Pricing", :image => File.new(Rails.root.join('creatives', 'pages', 'about.png')), :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
