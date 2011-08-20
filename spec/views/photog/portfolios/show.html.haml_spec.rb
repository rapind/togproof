require 'spec_helper'

describe "photog/portfolios/show.html.haml" do
  before(:each) do
    @portfolio = assign(:portfolio, stub_model(Portfolio,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
