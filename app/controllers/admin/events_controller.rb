class Admin::EventsController < Admin::HomeController
  respond_to :json, :html

  def index
    @events = Event.order('created_at desc').page(params[:page])
    respond_with :admin, @events
  end

end