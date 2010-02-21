class Client::BookingsController < Client::HomeController
  inherit_resources
  actions :index
  respond_to :html  
  before_filter :require_active_bookings  
  
  private #-------
    # Defining the collection explicitly for filtering
    def collection
      @bookings = current_client.bookings.find :all, :conditions => "expires_on IS NULL OR expires_on > '#{Date.today}'", :order => 'created_at'
    end
     
end
