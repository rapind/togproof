require 'spec_helper'

describe "photog/galleries/index.html.haml" do
  before(:each) do
    assign(:galleries, [
      stub_model(Gallery,
        :title => "Title"
      ),
      stub_model(Gallery,
        :title => "Title"
      )
    ])
  end

  it "renders a list of galleries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
