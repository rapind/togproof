def photog_sign_in
  password = 'password'
  photographer = FactoryGirl.create(:photographer, :password => password)

  visit '/photographers/sign_in'
  within("#photographer_new") do
    fill_in 'photographer_email', :with => photographer.email
    fill_in 'photographer_password', :with => password
    click_button 'Sign in'
  end
end
