require 'spec_helper'

describe "photog/portfolios/new.html.haml" do
  before(:each) do
    assign(:portfolio, stub_model(Portfolio,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new portfolio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => portfolios_path, :method => "post" do
      assert_select "input#portfolio_title", :name => "portfolio[title]"
    end
  end
end
