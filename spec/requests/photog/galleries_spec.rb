require 'spec_helper'
require 'requests/helper'

describe "Photog::Galleries" do

  # before(:each) do
  #   login_photographer
  # end

  describe "GET /photog/galleries" do
    it "works!" do
      get photog_galleries_path
      response.status.should be(200)
    end

    it "lists the galleries" do
      FactoryGirl.create(:gallery, :title => 'First Gallery')
      FactoryGirl.create(:gallery, :title => 'Second Gallery')

      visit photog_galleries_url
      page.should have_content('First Gallery')
      page.should have_content('Second Gallery')
    end
  end

  context "GET /photog/galleries/new" do
    it "works!" do
      get new_photog_gallery_path
      response.status.should be(200)
    end

    it "renders the new gallery form" do
      visit new_photog_gallery_path

      page.should have_css('input#gallery_title')
    end
  end

  context "GET /photog/galleries/:id/edit" do
    before do
      @gallery = FactoryGirl.create(:gallery)
    end

    it "works!" do
      get edit_photog_gallery_path(@gallery)
      response.status.should be(200)
    end

    it "renders the edit gallery form" do
      visit edit_photog_gallery_path(@gallery)
      page.should have_css('input#gallery_title')
    end
  end

end