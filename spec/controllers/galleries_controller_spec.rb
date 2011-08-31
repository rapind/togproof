require 'spec_helper'

describe GalleriesController do

  before do
    @gallery = FactoryGirl.create(:gallery)
  end

  describe "GET show" do

    it "assigns the requested gallery as @gallery when the secret token is used" do
      get :show, :id => @gallery.token
      assigns(:gallery).should eq(@gallery)
    end

    it "should not show the requested gallery when the ID is used" do
      get :show, :id => @gallery.id
      assigns(:gallery).should eq(@gallery)
    end

  end

end
