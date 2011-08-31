require 'spec_helper'
require 'controllers/helper'

describe Admin::PortfolioPhotosController do

  before do
    login_photographer
  end

  describe "DELETE destroy" do
    it "destroys the requested portfolio_photo" do
      portfolio_photo = FactoryGirl.create(:portfolio_photo)
      expect {
        delete :destroy, :portfolio_id => portfolio_photo.portfolio_id, :id => portfolio_photo.id
      }.to change(PortfolioPhoto, :count).by(-1)
    end
  end

end
