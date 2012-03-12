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

puts "Creating galleries"
Gallery.create!(:name => 'Family Session', :expires_on => 1.week.from_now)
gallery = Gallery.create!(:name => 'Newborn Session', :expires_on => 4.weeks.from_now)

puts "Uploading gallery images"
base_dir = Rails.root.join('creatives', 'galleries')
file_names = Dir.glob("#{base_dir}/*.jpg")
gallery = Gallery.first
file_names.each_with_index do |file_name, idx|
  puts "Uploading gallery photo: #{file_name}"
  begin
    gallery.photos.create!(:image => File.new(file_name))
  rescue Exception => e
    puts e.message
  end
end
