class Admin::PhotographerPasswordResetsController < Admin::HomeController  
  before_filter :require_no_photographer
  before_filter :load_photographer_using_perishable_token, :only => [:edit, :update]
  skip_before_filter :require_photographer
  
  def new  
    render
  end 
  
  def create
    @photographer = Photographer.find_by_email(params[:email])
    if @photographer  
      @photographer.deliver_password_reset_instructions! 
      flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."  
      redirect_to admin_login_path
    else  
      flash[:notice] = "We were unable to find an account with that email address."  
      render :action => :new  
    end  
  end
  
  def edit
    render  
  end  
  
  def update  
    @photographer.password = params[:photographer][:password]
    if @photographer.save  
      flash[:notice] = "Password successfully updated."  
      redirect_to admin_path
    else
      render :action => :edit  
    end
  end
  
  private #--------
  
    def load_photographer_using_perishable_token  
      @photographer = Photographer.find_using_perishable_token(params[:id])
      unless @photographer
        flash[:notice] = "We're sorry, but we could not locate your account. If you are having issues try copying and pasting the URL from your email into your browser or restarting the reset password process."
        redirect_to admin_login_path
      end
    end
  
end
