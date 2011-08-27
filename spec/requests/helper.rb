# def login_photographer
#   password = 'password'
#   photographer = FactoryGirl.create(:photographer, :password => password)
#
#   #visit '/photographers/sign_in'
#   visit photog_path
#   fill_in :photographer_email, :with => photographer.email
#   fill_in :photographer_password, :with => password
#   click_button 'Sign in'
# end

def login_photographer
  photographer = FactoryGirl.create(:photographer, :password => 'password')
  post photographer_session_path, :email => photographer.email, :password => 'password'
end