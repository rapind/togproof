def login_photographer
  @photographer = FactoryGirl.create(:photographer)
  sign_in @photographer
end