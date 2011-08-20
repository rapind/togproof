class Photog::PortfolioPhotosController < Photog::HomeController
  actions :destroy
  respond_to :js
  belongs_to :gallery

  # Update the position
  def update_position
    begin
      portfolio = Portfolio.find(params[:portfolio_id])
      photo = portfolio.portfolio_photos.find(params[:id])
      photo.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end

  def destroy
    destroy! do |success, failure|
      success.js { render :js => "$('#obj_#{@gallery_photo.to_param}').remove();" }
    end
  end
end