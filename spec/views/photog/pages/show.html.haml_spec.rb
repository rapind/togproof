require 'spec_helper'

describe "photog/pages/show.html.haml" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
