class Admin::PhotographersController < Admin::HomeController  
  inherit_resources
  actions :edit, :update
  before_filter :load_photographer
  
  # redirect to edit path on update instead of show
  def update
    update!{ edit_resource_path }
  end
  
  
  private #-----
  
  def load_photographer
    @photographer = Photographer.find :first
  end
  
end
