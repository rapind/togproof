FactoryGirl.define do

  factory :photographer do
    email 'factory@email.com'
    password 'factory-pwd'
    name 'Factory Photographer'
  end

  factory :page do
    title 'Factory Title'
    body 'Factory body is at least 10 characters long.'
  end

  factory :portfolio do
    title 'Factory Title'
  end

  factory :portfolio_photo do
    portfolio_id 1
    title 'Factory Title'
  end

  factory :gallery do
    title 'Factory Title'
  end

  factory :gallery_photo do
    gallery_id 1
    title 'Factory Title'
  end

end