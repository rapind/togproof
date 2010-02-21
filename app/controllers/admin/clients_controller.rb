class Admin::ClientsController < Admin::HomeController
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
        render :json => {:title => 'Success', :message => 'Client was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the client. Please try again later.'} }
    end
  end
  
  def invite
    @client = Client.find(params[:id])
  end
  
  # send the client's welcome email
  def send_invite
    client = Client.find(params[:id])
    custom_message = params[:custom_message]
    client.deliver_invite!(config, custom_message)
    flash[:notice] = "Client invitation sent."
    redirect_to admin_clients_path
  end
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @clients ||= end_of_association_chain.paginate :include => :bookings, :page => params[:page], :per_page => 15, :order => 'name'
    end
    
end
