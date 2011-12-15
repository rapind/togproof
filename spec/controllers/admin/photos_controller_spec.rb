require 'spec_helper'

describe Admin::PhotosController do

  before do
    @photographer = FactoryGirl.create(:photographer)
    sign_in @photographer
  end

  describe "DELETE destroy" do
    it "destroys the requested photo" do
      photo = FactoryGirl.create(:photo)
      expect {
        delete :destroy, :gallery_id => photo.gallery_id, :id => photo.id
      }.to change(Photo, :count).by(-1)
    end
  end

end
