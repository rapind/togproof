class Client::PhotosController < Client::HomeController
  inherit_resources
  belongs_to :booking
  actions :index, :show
  respond_to :html
  before_filter :require_active_bookings
  
  def index
    index! {
      return unless require_ownership and not_expired
    }
  end
  
  def show
    show! {
      return unless require_ownership and not_expired
    }
  end
  
  
  private #--------
    # make sure the client is logged in and owns the bookings / photos they are trying to access
    def require_ownership
      if current_client.id == @booking.client.id
        return true
      else
        # doesn't own the parent booking
        flash[:warning] = 'You can only view bookings and photos associated with your account.'
        redirect_to client_bookings_path # back to the bookings they DO own
        return false
      end
    end
    
    # check if the parent booking has expired (true = hasn't expired, false = has expired)
    def not_expired
      (@booking.expires_on.blank? or @booking.expires_on > Date.today)
    end
  
end
