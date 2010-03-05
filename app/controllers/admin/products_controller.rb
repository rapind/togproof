class Admin::ProductsController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html
  
  # check ownership and redirect to collection path on create instead of show
  def create
    @product = current_photographer.products.new(params[:product])
    create!{ collection_path }
  end
  
  # check ownership and redirect to collection path on update instead of show
  def update
    @product = current_photographer.products.find(params[:id])
    update!{ collection_path }
  end
  
  # check ownership
  def destroy
    @product = current_photographer.products.find(params[:id])
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Product was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the product. Please try again later.'} }
    end
  end
  
  # check ownership and update an individual product's position
  def update_position
    begin
      product = current_photographer.products.find(params[:id])
      product.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @products ||= current_photographer.products.find :all
    end
    
end
