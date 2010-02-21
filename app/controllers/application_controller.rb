class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  helper_method :current_client_session, :current_client, :current_photographer_session, :current_photographer
  filter_parameter_logging :password
  before_filter :config
  
  #unless ActionController::Base.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, ActionController::UnknownController, ActionController::UnknownAction, :with => :render_404
  #end
  
  private #-------
    
    def render_404
      redirect_to not_found_path
    end
    
    # retrieve site configuration information
    def config
      return @config if defined?(@config)
      begin
        @config = Photographer.find(:first) #configuration is stored in the photographer model for now (simple)
      rescue Exception => e
        flash[:error] = e.message
        redirect_to config_error_path
        return
      end
    end
    
    def current_client_session
      return @current_client_session if defined?(@current_client_session)
      @current_client_session = ClientSession.find
    end

    def current_client
      return @current_client if defined?(@current_client)
      @current_client = current_client_session && current_client_session.record
    end
    
    def require_client
      unless current_client
        store_location
        #flash[:notice] = "You must be logged in to access this page."
        redirect_to client_login_path
        return false
      end
    end
    
    def require_no_client
      if current_client
        store_location
        redirect_to client_path
        return false
      end
    end
    
    def current_photographer_session
      return @current_photographer_session if defined?(@current_photographer_session)
      @current_photographer_session = PhotographerSession.find
    end

    def current_photographer
      return @current_photographer if defined?(@current_photographer)
      @current_photographer = current_photographer_session && current_photographer_session.record
    end
    
    def require_photographer
      unless current_photographer
        store_location
        #flash[:notice] = "You must be logged in to access this page."
        redirect_to new_admin_photographer_session_url
        return false
      end
    end
    
    def require_no_photographer
      if current_photographer
        store_location
        #flash[:notice] = "You must be logged out to access this page."
        redirect_to admin_path
        return false
      end
    end

    def store_location
      session[:return_to] = request.get? ? request.request_uri : request.referer
    end
    
    def clear_location
      session[:return_to] = nil
    end

    def redirect_back_or_default
      if session[:return_to]
        redirect_to session[:return_to]
        session[:return_to] = nil
      elsif request.request_uri.include?('/admin')
        redirect_to admin_clients_path
      else
        redirect_to client_bookings_path
      end
    end
    
end
