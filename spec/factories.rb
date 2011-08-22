FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :name do |n|
    "Person #{n}"
  end
  sequence :title do |n|
    "Title #{n}"
  end

  factory :photographer do
    email
    password 'factory-pwd'
    name
  end

  factory :page do
    title
    body 'Factory body is at least 10 characters long.'
  end

  factory :portfolio do
    title
  end

  factory :portfolio_photo do
    portfolio
    title
  end

  factory :gallery do
    title
  end

  factory :gallery_photo do
    gallery
    title
  end

end