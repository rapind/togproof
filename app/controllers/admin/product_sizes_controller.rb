class Admin::ProductSizesController < Admin::HomeController
  inherit_resources
  belongs_to :product
  actions :all, :except => :show
  respond_to :html
  before_filter :require_ownership
  
  # redirect to collection path on create instead of show
  def create
    create!{ collection_path }
  end
  
  # redirect to collection path on update instead of show
  def update
    update!{ collection_path }
  end
  
  def destroy
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Photo was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the photo. Please try again later.'} }
    end
  end
  
  # update an individual product photo's position
  def update_position
    begin
      product_size = @product.product_sizes.find(params[:id]) # grab the object
      product_size.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      logger.error $ERROR_INFO.inspect
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
    
    
  private #-----
  
    # make sure the photographer owns the product / photos they are trying to access
    def require_ownership
      @product = Product.find(params[:product_id])
      if current_photographer.id == @product.photographer.id
        return true
      else
        # doesn't own the parent booking
        flash[:warning] = 'You can only manage products associated with your account.'
        redirect_to admin_products_path # back to the galleries they DO own
        return false
      end
    end
    
end
