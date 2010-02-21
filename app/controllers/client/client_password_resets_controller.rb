class Client::ClientPasswordResetsController < Client::HomeController
  skip_before_filter :require_client
  before_filter :require_no_client
  before_filter :load_client_using_perishable_token, :only => [:edit, :update]
  
  def new
    render
  end
  
  def create  
    @client = Client.find_by_email(params[:email])
    if @client  
      @client.deliver_password_reset_instructions!(config)
      flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."  
      redirect_to client_path
    else  
      flash[:notice] = "We were unable to find an account with that email address."  
      render :action => :new  
    end  
  end
  
  def edit
    render  
  end  
  
  def update  
    @client.password = params[:client][:password]  
    if @client.save  
      flash[:notice] = "Password successfully updated."  
      redirect_to client_path
    else
      render :action => :edit  
    end
  end
  
  private #--------
  
    def load_client_using_perishable_token  
      @client = Client.find_using_perishable_token(params[:id])
      unless @client
        flash[:notice] = "We're sorry, but we could not locate your account. If you are having issues try copying and pasting the URL from your email into your browser or restarting the reset password process."
        redirect_to client_login_path 
      end
    end
  
end
