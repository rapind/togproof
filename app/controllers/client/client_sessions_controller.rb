class Client::ClientSessionsController < Client::HomeController
  skip_before_filter :require_client, :only => [:new, :create]
  before_filter :require_no_client, :only => [:new, :create]

  def new
    @client_session = ClientSession.new
  end

  def create
    @client_session = ClientSession.new(params[:client_session])
    if @client_session.save
      @current_client = Client.find_by_email(@client_session.email)
      flash[:notice] = "Login successful."
      redirect_to client_bookings_path
    else
      render :action => :new
    end
  end

  def destroy
    current_client_session.destroy
    session[:return_to] = request.referer
    #flash[:notice] = "Logout successful."
    redirect_to '/'
  end
  
end
