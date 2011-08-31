class Admin::PortfolioPhotosController < Admin::HomeController
  actions :destroy
  respond_to :json
  belongs_to :portfolio

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

end