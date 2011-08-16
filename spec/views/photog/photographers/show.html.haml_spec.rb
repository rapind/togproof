require 'spec_helper'

describe "photog/photographers/show.html.haml" do
  before(:each) do
    @photographer = assign(:photographer, stub_model(Photographer,
      :name => "Name",
      :phone => "Phone",
      :blog_url => "Blog Url",
      :facebook_url => "Facebook Url",
      :twitter_url => "Twitter Url",
      :google_analytics_key => "Google Analytics Key",
      :use_watermark => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Blog Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Facebook Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Twitter Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Google Analytics Key/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
