class Admin::PhotographersController < Admin::HomeController
  respond_to :html
  before_filter :load_resource

  def edit
    respond_with :admin, @photographer
  end

  def update
    @photographer.update_attributes params[:photographer]
    if @photographer.valid?
      respond_with(@photographer, :location => edit_admin_photographer_path)
    else
      respond_with :admin, @photographer
    end
  end

  private #----

    # make sure everything is scoped to the current_photographer so we can't access / modify other user's content.
    def load_resource
      @photographer = Photographer.first
    end

end