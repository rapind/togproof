class Admin::PhotoCommentsController < Admin::HomeController
  inherit_resources
  belongs_to :photo, :booking, :polymorphic => true
  actions :index, :show, :new, :create
  respond_to :html, :js
  
  def create
    @photo = Photo.find(params[:photo_id])
    @photo_comment = @photo.photo_comments.new(params[:photo_comment])
    @photo_comment.photographer = current_photographer
    respond_to do |format|
      if @photo_comment.save
        format.html { 
          flash[:notice] = 'Comment was added successfuly.'
          redirect_to admin_booking_photo_path(@photo.booking, @photo) 
        }
        format.js { render :json => {:title => 'Success', :message => 'Comment was successful.', :id => @photo_comment.id } }
      else
        format.html { 
          flash[:notice] = 'Ran into an error adding your comment. Please try again.'
          redirect_to admin_booking_photo_path(@photo.booking, @photo) 
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
    
end
