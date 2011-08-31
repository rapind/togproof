require 'spec_helper'

describe "portfolios" do

  context "index" do
    it "lists the portfolios" do
      FactoryGirl.create(:portfolio, :title => 'First Portfolio')
      FactoryGirl.create(:portfolio, :title => 'Second Portfolio')

      visit portfolios_path
      page.should have_content('First Portfolio')
      page.should have_content('Second Portfolio')
    end
  end

  context "show" do
    before do
      @portfolio = FactoryGirl.create(:portfolio)
    end

    it "renders the portfolio" do
      visit portfolio_path(@portfolio.to_param)
      page.should have_content(@portfolio.title)
    end
  end

end