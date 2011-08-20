require 'spec_helper'

describe "photog/portfolio_photos/index.html.haml" do
  before(:each) do
    assign(:portfolio_photos, [
      stub_model(PortfolioPhoto,
        :title => "Title"
      ),
      stub_model(PortfolioPhoto,
        :title => "Title"
      )
    ])
  end

  it "renders a list of portfolio_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
