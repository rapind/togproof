class Admin::PortfoliosController < Admin::HomeController
  actions :all, :except => :show
  respond_to :html, :json

  # Update the position
  def update_position
    begin
      portfolio = Portfolio.find(params[:id])
      portfolio.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end

  # Update the photo position
  def update_photo_position
    begin
      portfolio = Portfolio.find(params[:id])
      portfolio_photo = portfolio.portfolio_photos.find(params[:photo_id])
      portfolio_photo.insert_at(params[:position].to_i)
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      logger.error $ERROR_INFO.inspect
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end

  def destroy
    destroy! do |success, failure|
      success.js { render :js => "$('#obj_#{@gallery_photo.to_param}').remove();" }
    end
  end

  private #----

    # Sort the collection.
    def collection
      @portfolios ||= end_of_association_chain.order('position')
    end

end