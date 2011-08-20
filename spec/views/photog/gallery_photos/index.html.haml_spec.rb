require 'spec_helper'

describe "photog/gallery_photos/index.html.haml" do
  before(:each) do
    assign(:gallery_photos, [
      stub_model(GalleryPhoto,
        :title => "Title"
      ),
      stub_model(GalleryPhoto,
        :title => "Title"
      )
    ])
  end

  it "renders a list of gallery_photos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
