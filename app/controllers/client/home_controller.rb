class Client::HomeController < ApplicationController
  # this removes the layout for all ajax requests
  layout proc { |controller| controller.request.xhr? ? nil : 'client' }
  
  before_filter :require_client
  
  # landing page 
  def index
  end
  
  protected #-----
  
    def require_active_bookings
      logger.debug "checking for bookings"
      unless current_client.has_active_bookings?
        flash[:notice] = "You currently have no active bookings in the system."
        redirect_to client_error_path
        return
      end
    end
    
end