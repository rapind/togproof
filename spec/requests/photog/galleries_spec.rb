require 'spec_helper'
require 'requests/request_helper'

describe "photog/galleries" do

  before do
    photog_sign_in
  end

  context "index" do
    it "lists the galleries" do
      FactoryGirl.create(:gallery, :title => 'First Gallery')
      FactoryGirl.create(:gallery, :title => 'Second Gallery')

      visit photog_galleries_url
      page.should have_content('First Gallery')
      page.should have_content('Second Gallery')
    end
  end

  context "new" do
    it "renders the new gallery form" do
      visit new_photog_gallery_url

      page.should have_css('form')
      page.should have_css('input#gallery_title')
    end
  end

  context "edit" do

    before do
      @gallery = FactoryGirl.create(:gallery)
    end

    it "renders the edit gallery form" # do
     #      visit edit_photog_gallery_url(@gallery.to_param)
     #
     #      page.should have_css('form')
     #      page.should have_css('input#gallery_title')
     #    end

  end

end