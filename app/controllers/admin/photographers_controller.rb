class Admin::PhotographersController < Admin::HomeController
  inherit_resources
  respond_to :html
  actions :edit, :update
  before_filter :load_photographer

  # Redirect to the edit path on update instead of show
  def update
    update!{ edit_admin_photographer_path }
  end

  private #----

    # make sure everything is scoped to the current_photographer so we can't access / modify other user's content.
    def load_photographer
      @photographer = Photographer.first
    end

end