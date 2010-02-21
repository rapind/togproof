class Admin::PagesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show
  respond_to :html
  
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
        render :json => {:title => 'Success', :message => 'Page was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the page. Please try again later.'} }
    end
  end
  
  # update an individual page's position
  def update_position
    begin
      page = Page.find(params[:id]) # grab the object
      page.insert_at(params[:position].to_i) # update the object's order
      render :json => {:title => 'Success', :message => 'The order was updated successfuly.'}
    rescue
      render :json => {:title => 'Error', :message => 'Ran into an error updating the order. Please try again.'}
    end
  end
  
  private #-------
    # Defining the collection explicitly for ordering
    def collection
      @pages ||= end_of_association_chain.find :all, :order => 'position'
    end
    
end
