require 'spec_helper'

describe Photog::GalleryPhotosController do

  before(:each) do
    @photographer = FactoryGirl.create(:photographer)
    sign_in @photographer
  end

  describe "DELETE destroy" do
    it "destroys the requested gallery_photo" do
      gallery_photo = FactoryGirl.create(:gallery_photo)
      expect {
        delete :destroy, :gallery_id => gallery_photo.gallery_id, :id => gallery_photo.id
      }.to change(GalleryPhoto, :count).by(-1)
    end
  end

end
