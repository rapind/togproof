class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      'photog' # for authentication
    else
      'application' # default
    end
  end

  def not_found!
    raise ActionController::RoutingError.new('Not Found')
  end

end
