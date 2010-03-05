class Admin::QuotesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html
  
  # check ownership and redirect to collection path on create instead of show
  def create
    @quote = current_photographer.quotes.new(params[:quote])
    create!{ collection_path }
  end
  
  # check ownership and redirect to collection path on update instead of show
  def update
    @quote = current_photographer.quotes.find(params[:id])
    update!{ collection_path }
  end
  
  # check ownership
  def destroy
    @quote = current_photographer.quotes.find(params[:id])
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Quote was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the quote. Please try again later.'} }
    end
  end
  
  # check ownership and update an individual quote's position
  def update_position
    begin
      quote = current_photographer.quotes.find(params[:id])
      quote.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @quotes ||= current_photographer.quotes.find :all
    end
    
end
