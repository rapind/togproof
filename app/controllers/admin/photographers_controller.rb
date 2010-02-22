class Admin::PhotographersController < Admin::HomeController  
  inherit_resources
  actions :edit, :update
  before_filter :load_photographer
  before_filter :check_demo_mode, :only => :update
  
  # redirect to edit path on update instead of show
  def update
    update!{ edit_resource_path }
  end
  
  
  private #-----
  
  def load_photographer
    @photographer = Photographer.find :first
  end
  
  def check_demo_mode
    if defined?(DEMO_MODE) and DEMO_MODE
      flash[:notice] = 'Cannot modify the settings in demo mode.'
      redirect_to edit_admin_photographer_path
    end
  end
  
end
