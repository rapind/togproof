require 'spec_helper'

describe "photog/photographers/edit.html.haml" do
  before(:each) do
    @photographer = assign(:photographer, stub_model(Photographer,
      :name => "MyString",
      :phone => "MyString",
      :blog_url => "MyString",
      :facebook_url => "MyString",
      :twitter_url => "MyString",
      :google_analytics_key => "MyString",
      :use_watermark => false
    ))
  end

  it "renders the edit photographer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => photog_photographers_path(@photographer), :method => "post" do
      assert_select "input#photographer_name", :name => "photographer[name]"
      assert_select "input#photographer_phone", :name => "photographer[phone]"
      assert_select "input#photographer_blog_url", :name => "photographer[blog_url]"
      assert_select "input#photographer_facebook_url", :name => "photographer[facebook_url]"
      assert_select "input#photographer_twitter_url", :name => "photographer[twitter_url]"
      assert_select "input#photographer_google_analytics_key", :name => "photographer[google_analytics_key]"
      assert_select "input#photographer_use_watermark", :name => "photographer[use_watermark]"
    end
  end
end
