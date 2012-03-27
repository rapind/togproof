class Admin::EventsController < Admin::HomeController
  inherit_resources
  actions :index

  private #----
  
    def collection
      @events ||= end_of_association_chain.page(params[:page])
    end
    
end