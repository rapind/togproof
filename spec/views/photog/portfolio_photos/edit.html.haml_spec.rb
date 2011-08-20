require 'spec_helper'

describe "photog/portfolio_photos/edit.html.haml" do
  before(:each) do
    @portfolio_photo = assign(:portfolio_photo, stub_model(PortfolioPhoto,
      :title => "MyString"
    ))
  end

  it "renders the edit portfolio_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => portfolio_photos_path(@portfolio_photo), :method => "post" do
      assert_select "input#portfolio_photo_title", :name => "portfolio_photo[title]"
    end
  end
end
