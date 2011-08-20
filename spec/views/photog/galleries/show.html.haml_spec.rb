require 'spec_helper'

describe "photog/galleries/show.html.haml" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
