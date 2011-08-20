require 'spec_helper'

describe "pages/edit.html.haml" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "MyString"
    ))
  end

  it "renders the edit page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pages_path(@page), :method => "post" do
      assert_select "input#page_title", :name => "page[title]"
    end
  end
end
