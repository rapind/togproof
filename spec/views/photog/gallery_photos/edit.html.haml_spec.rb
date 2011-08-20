require 'spec_helper'

describe "photog/gallery_photos/edit.html.haml" do
  before(:each) do
    @gallery_photo = assign(:gallery_photo, stub_model(GalleryPhoto,
      :title => "MyString"
    ))
  end

  it "renders the edit gallery_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gallery_photos_path(@gallery_photo), :method => "post" do
      assert_select "input#gallery_photo_title", :name => "gallery_photo[title]"
    end
  end
end
