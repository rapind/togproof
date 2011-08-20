require 'spec_helper'

describe "galleries/new.html.haml" do
  before(:each) do
    assign(:gallery, stub_model(Gallery,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new gallery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => galleries_path, :method => "post" do
      assert_select "input#gallery_title", :name => "gallery[title]"
    end
  end
end
