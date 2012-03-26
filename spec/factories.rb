FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :name do |n|
    "Name #{n}"
  end

  factory :photographer do
    email
    password 'factory-pwd'
    name
    description 'Factory description is at least 10 characters long'
  end

  factory :page do
    name
    body 'Factory body is at least 10 characters long.'
  end

  factory :portfolio do
    name
  end

  factory :portfolio_photo do
    portfolio
    name
  end

  factory :private_gallery do
    name
  end

  factory :photo do
    private_gallery
    name
  end

  factory :app_config do
    name
  end

end
