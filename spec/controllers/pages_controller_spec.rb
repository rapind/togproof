require 'spec_helper'

describe PagesController do

  before(:all) do
    FactoryGirl.create(:photographer)
  end
  
  before(:each) do
    @page = FactoryGirl.create(:page)
  end

  describe "GET show" do

    it "assigns the requested page as @page" do
      get :show, :id => @page.to_param
      assigns(:page).should eq(@page)
    end

  end

end