class Admin::BookingsController < Admin::HomeController
  inherit_resources
  belongs_to :client, :optional => true
  actions :all, :except => :show
  respond_to :html
  
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
end
