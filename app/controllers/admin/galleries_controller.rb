class Admin::GalleriesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html
  after_filter :clear_cache, :only => [:create, :update, :destroy, :update_position]
  
  # check ownership and redirect to collection path on create instead of show
  def create
    @gallery = current_photographer.galleries.new(params[:gallery])
    create!{ collection_path }
  end
  
  # check ownership and redirect to collection path on update instead of show
  def update
    @gallery = current_photographer.galleries.find(params[:id])
    update!{ collection_path }
  end
  
  # check ownership
  def destroy
    @gallery = current_photographer.galleries.find(params[:id])
    destroy! do |success, failure|
      success.js { 
        flash[:notice] = ''
        render :json => {:title => 'Success', :message => 'Gallery was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the gallery. Please try again later.'} }
    end
  end
  
  # check ownership and update an individual gallery's position
  def update_position
    begin
      gallery = current_photographer.galleries.find(params[:id])
      gallery.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @galleries ||= current_photographer.galleries.find :all
    end
    
    def clear_cache
      expire_action :controller => '/galleries', :action => :index
    end
    
end
