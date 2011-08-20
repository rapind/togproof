require 'spec_helper'

describe "Photog::GalleryPhotos" do
  describe "GET /photog/gallery_photos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get photog_gallery_photos_path
      response.status.should be(200)
    end
  end
end
