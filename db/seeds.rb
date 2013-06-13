# Creating photographer
Photographer.create(
  name: "Your Company Name",
  meta_title: "Shows as the browser's title for the landing page.",
  tagline: "Describe the services that you provide here.",
  email: "grok@grokphoto.org",
  password: "password",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  google_analytics_key: "UA-2450369-XX",
  time_zone: "Eastern Time (US & Canada)",
  disqus_short_name: "grokphoto"
)

# Creating galleries
base_dir = Rails.root.join('creatives', 'galleries')
Gallery.create!(position: 1, name: 'Maternity', cover: File.new(File.join(base_dir, 'maternity.jpg')), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
Gallery.create!(position: 2, name: 'Newborn', cover: File.new(File.join(base_dir, 'newborn.jpg')), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
Gallery.create!(position: 3, name: 'Babies', cover: File.new(File.join(base_dir, 'babies.jpg')), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')

# Uploading gallery images
Gallery.all.each do |gallery|
  dir = File.join(base_dir, gallery.name.parameterize)
  file_names = Dir.glob("#{dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading gallery photo: #{file_name}"
    begin
      gallery.photos.create!(photo: File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end

# Creating private galleries
PrivateGallery.create!(name: 'Jane Smith Family Session', expires_on: 1.week.from_now)
PrivateGallery.create!(name: 'Sue Jones Newborn Session', expires_on: 4.weeks.from_now)

# Uploading private gallery images
base_dir = Rails.root.join('creatives', 'private_galleries')
PrivateGallery.all.each do |private_gallery|
  dir = File.join(base_dir, private_gallery.name.parameterize)
  file_names = Dir.glob("#{dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading private gallery photo: #{file_name}"
    begin
      private_gallery.photos.create!(photo: File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end

# Creating pages
Page.create(name: "About", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Page.create(name: "Pricing", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

# Creating posts
Post.create(title: "Baby Stuey at One Week", keywords: 'baby, photography, newborns', image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Post.create(title: "The Jones Family Portraits", keywords: 'family, photography, portrait, lifestyle', image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Post.create(title: "This is how we handle titles that are extraordinarily long.", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
