require 'spec_helper'

describe "galleries" do

  context "show" do
    before do
      @gallery = FactoryGirl.create(:gallery)
    end

    it "renders the page" do
      visit gallery_path(@gallery.token)
      page.should have_content(@gallery.title)
    end
  end

end