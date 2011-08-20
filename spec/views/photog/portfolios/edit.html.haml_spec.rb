require 'spec_helper'

describe "photog/portfolios/edit.html.haml" do
  before(:each) do
    @portfolio = assign(:portfolio, stub_model(Portfolio,
      :title => "MyString"
    ))
  end

  it "renders the edit portfolio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => portfolios_path(@portfolio), :method => "post" do
      assert_select "input#portfolio_title", :name => "portfolio[title]"
    end
  end
end
