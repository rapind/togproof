require 'spec_helper'
require 'requests/request_helper'

describe "photog/portfolios" do

  before do
    photog_sign_in
  end

  context "index" do
    it "lists the portfolios" do
      FactoryGirl.create(:portfolio, :title => 'First Portfolio')
      FactoryGirl.create(:portfolio, :title => 'Second Portfolio')

      visit photog_portfolios_path
      #page.html.should match /First Portfolio/i
      response.should have_content('First Portfolio')
      response.should have_content('Second Portfolio')
    end
  end

  context "new" do
    it "renders the new portfolio form" do
      visit new_photog_portfolio_path

      response.should have_css('form')
      response.should have_css('input#portfolio_title')
    end
  end

  context "edit" do

    before do
      @portfolio = FactoryGirl.create(:portfolio)
    end

    it "renders the edit portfolio form" do
      visit edit_photog_portfolio_path(@portfolio.to_param)

      response.should have_css('form')
      response.should have_css('input#portfolio_title')
    end

  end

end