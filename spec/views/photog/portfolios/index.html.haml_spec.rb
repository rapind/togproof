require 'spec_helper'

describe "photog/portfolios/index.html.haml" do
  before(:each) do
    assign(:portfolios, [
      stub_model(Portfolio,
        :title => "Title"
      ),
      stub_model(Portfolio,
        :title => "Title"
      )
    ])
  end

  it "renders a list of portfolios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
