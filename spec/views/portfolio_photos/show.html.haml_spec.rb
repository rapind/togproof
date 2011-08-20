require 'spec_helper'

describe "portfolio_photos/show.html.haml" do
  before(:each) do
    @portfolio_photo = assign(:portfolio_photo, stub_model(PortfolioPhoto,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
