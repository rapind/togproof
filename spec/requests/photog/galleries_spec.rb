require 'spec_helper'

describe "Photog::Galleries" do
  describe "GET /photog/galleries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get photog_galleries_path
      response.status.should be(200)
    end
  end
end
