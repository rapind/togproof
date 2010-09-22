class Admin::PhotographerSessionsController < Admin::HomeController
  before_filter :require_no_photographer, :except => :destroy
  skip_before_filter :require_photographer, :except => :destroy
  
  def new
    @photographer_session = PhotographerSession.new
  end

  def create
    @photographer_session = PhotographerSession.new(params[:photographer_session])
    if @photographer_session.save
      flash[:notice] = "Photographer Login successful!".html_safe
      redirect_back_or_default
    else
      render :action => :new
    end
  end

  def destroy
    session[:return_to] = request.referer
    current_photographer_session.destroy
    flash[:notice] = "Photographer Logout successful!"
    redirect_to new_admin_photographer_session_url
  end
end
