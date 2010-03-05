class Admin::BookingsController < Admin::HomeController
  inherit_resources
  belongs_to :client, :optional => true
  actions :all, :except => :show
  respond_to :html
  before_filter :require_ownership
  
  def new
    new! {
      @booking.occurs_on = 2.weeks.from_now
      @booking.expires_on = 4.weeks.from_now
    }
  end
  
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
        render :json => {:title => 'Success', :message => 'Booking was successfuly removed.'} 
      }
      failure.js { render :json => {:title => 'Error', :message => 'Ran into an error removing the booking. Please try again later.'} }
    end
  end
  
  private #----
  
    # make sure the photographer owns the bookings / photos they are trying to access
    def require_ownership
      @client = Client.find(params[:client_id])
      if current_photographer.id == @client.photographer.id
        return true
      else
        # doesn't own the parent booking
        flash[:warning] = 'You can only manage bookings and photos associated with your account.'
        redirect_to admin_bookings_path # back to the bookings they DO own
        return false
      end
    end
    
  
end
