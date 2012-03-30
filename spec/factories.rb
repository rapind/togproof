FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :name do |n|
    "Name #{n}"
  end
  sequence :title do |n|
    "Title #{n}"
  end

  factory :photographer do
    email
    password 'factory-pwd'
    name
    tagline 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
    time_zone 'Eastern Time (US & Canada)'
    description 'Factory description is at least 10 characters long'
  end

  factory :page do
    name
    body 'Factory body is at least 10 characters long.'
  end
  
  factory :post do
    title
    body 'Factory body is at least 10 characters long.'
  end

  factory :gallery do
    name
    cover File.new(Rails.root.join('creatives', 'galleries', 'families.jpg'))
  end
  
  factory :private_gallery do
    name
  end

  factory :photo do
    name
    photo File.new(Rails.root.join('creatives', 'galleries', 'families', 'family-01.jpg'))
  end

end
