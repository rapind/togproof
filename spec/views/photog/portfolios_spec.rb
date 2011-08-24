require 'spec_helper'
require 'views/view_helper'

describe "photog/portfolios" do

  before(:each) do
    photog_sign_in
  end

  context "index" do
    it "lists the portfolios" do
      FactoryGirl.create(:portfolio, :title => 'First Portfolio')
      FactoryGirl.create(:portfolio, :title => 'Second Portfolio')

      visit photog_portfolios_path
      #page.html.should match /First Portfolio/i
      page.should have_content('First Portfolio')
      page.should have_content('Second Portfolio')
    end
  end

  context "new" do
    it "renders the new portfolio form" do
      visit new_photog_portfolio_path

      page.should have_css('form')
      page.should have_css('input#portfolio_title')
    end
  end

  context "edit" do

    before do
      @portfolio = FactoryGirl.create(:portfolio)
    end

    it "renders the edit portfolio form" do
      visit edit_photog_portfolio_path(@portfolio.to_param)

      page.should have_css('form')
      page.should have_css('input#portfolio_title')
    end

  end

end