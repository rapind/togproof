require 'spec_helper'

describe "photog/pages/index.html.haml" do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :title => "Title"
      ),
      stub_model(Page,
        :title => "Title"
      )
    ])
  end

  it "renders a list of pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
