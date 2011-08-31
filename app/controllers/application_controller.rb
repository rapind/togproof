class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected #----

    def layout_by_resource
      if devise_controller?
        'admin' # for authentication
      else
        'public' # default
      end
    end

    def not_found!
      raise ActionController::RoutingError.new('Not Found')
    end

end
