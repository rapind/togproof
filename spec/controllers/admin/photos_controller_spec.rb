require 'spec_helper'

describe Admin::PhotosController do

  before do
    @photographer = FactoryGirl.create(:photographer)
    sign_in @photographer
  end

  describe "DELETE destroy for a gallery" do
    it "destroys the requested photo" do
      photo = FactoryGirl.create(:photo, :gallery => FactoryGirl.create(:gallery))
      expect {
        delete :destroy, :id => photo.id, :gallery_id => photo.gallery_id
      }.to change(Photo, :count).by(-1)
    end
  end
  
  describe "DELETE destroy for a private gallery" do
    it "destroys the requested photo" do
      photo = FactoryGirl.create(:photo, :private_gallery => FactoryGirl.create(:private_gallery))
      expect {
        delete :destroy, :id => photo.id, :private_gallery_id => photo.private_gallery_id
      }.to change(Photo, :count).by(-1)
    end
  end

end
