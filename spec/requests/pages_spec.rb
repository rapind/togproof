require 'spec_helper'

describe "pages" do

  context "show" do
    before do
      @page = FactoryGirl.create(:page)
    end

    it "renders the page" do
      visit page_path(@page.to_param)
      page.should have_content(@page.title)
    end
  end

end