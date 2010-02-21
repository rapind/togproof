class Client::PhotoCommentsController < Client::HomeController
  inherit_resources
  belongs_to :photo, :booking, :polymorphic => true
  actions :index, :show, :new, :create
  respond_to :html, :js
  before_filter :require_active_bookings
  
  def index
    index! { return unless require_ownership }
  end
  
  def show
    show! { return unless require_ownership }
  end
  
  def new
    new! { return unless require_ownership }
  end
  
  def create
    @photo = Photo.find(params[:photo_id])
    return unless require_ownership
    @photo_comment = @photo.photo_comments.new(params[:photo_comment])
    @photo_comment.client = current_client
    respond_to do |format|
      if @photo_comment.save
        format.html { 
          flash[:notice] = 'Comment was added successfuly.'
          redirect_to client_booking_photo_path(@photo.booking, @photo) 
        }
        format.js { render :json => {:title => 'Success', :message => 'Comment was successful.', :id => @photo_comment.id } }
      else
        format.html { 
          flash[:notice] = 'Ran into an error adding your comment. Please try again.'
          redirect_to client_booking_photo_path(@photo.booking, @photo) 
        }
        format.js { render :json => {:title => 'Error', :message => 'Ran into an error adding the comment. Please try again later.'} }
      end
    end
  end
  
  private #-------
    # Defining the collection explicitly for paging
    def collection
      @comments ||= end_of_association_chain.paginate :page => params[:page], :per_page => 10, :order => 'created_at DESC'
    end
    
    private #--------
      # make sure the client is logged in and owns the bookings / photos they are trying to access
      def require_ownership
        if defined?(@booking)
          on_client_id = @booking.client.id
        else
          on_client_id = @photo.booking.client.id
        end
        if current_client.id == on_client_id
          return true
        else
          # doesn't own the parent booking
          flash[:warning] = 'You can only view bookings and photos associated with your account.'
          redirect_to client_bookings_path # back to the bookings they DO own
          return false
        end
      end
      
end
