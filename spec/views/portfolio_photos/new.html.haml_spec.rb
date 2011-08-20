require 'spec_helper'

describe "portfolio_photos/new.html.haml" do
  before(:each) do
    assign(:portfolio_photo, stub_model(PortfolioPhoto,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new portfolio_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => portfolio_photos_path, :method => "post" do
      assert_select "input#portfolio_photo_title", :name => "portfolio_photo[title]"
    end
  end
end
