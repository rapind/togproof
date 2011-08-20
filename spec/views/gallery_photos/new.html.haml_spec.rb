require 'spec_helper'

describe "gallery_photos/new.html.haml" do
  before(:each) do
    assign(:gallery_photo, stub_model(GalleryPhoto,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new gallery_photo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gallery_photos_path, :method => "post" do
      assert_select "input#gallery_photo_title", :name => "gallery_photo[title]"
    end
  end
end
