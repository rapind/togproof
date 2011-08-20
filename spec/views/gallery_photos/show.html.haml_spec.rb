require 'spec_helper'

describe "gallery_photos/show.html.haml" do
  before(:each) do
    @gallery_photo = assign(:gallery_photo, stub_model(GalleryPhoto,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
