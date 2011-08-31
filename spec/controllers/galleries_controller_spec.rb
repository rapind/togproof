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

    it "should alert the user that the gallery couldn't be found when the ID is used instead of a secure token" do
      get :show, :id => @gallery.id
      flash[:alert].should eq("Unable to find that gallery.")
    end

  end

end
