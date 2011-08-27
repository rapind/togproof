def login_photographer
  #@request.env["devise.mapping"] = Devise.mappings[:photographer]
  @photographer = FactoryGirl.create(:photographer)
  sign_in @photographer
end