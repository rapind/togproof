class Admin::PackagesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html
  
  # check ownership and redirect to collection path on create instead of show
  def create
    @package = current_photographer.packages.new(params[:package])
    create!{ collection_path }
  end
  
  # check ownership and redirect to collection path on update instead of show
  def update
    @package = current_photographer.packages.find(params[:id])
    update!{ collection_path }
  end
  
  # check ownership
  def destroy
    @package = current_photographer.packages.find(params[:id])
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Package was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the package. Please try again later.'} }
    end
  end
  
  # check ownership and update an individual package's position
  def update_position
    begin
      package = current_photographer.packages.find(params[:id])
      package.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @packages ||= current_photographer.packages.find :all
    end
    
end
