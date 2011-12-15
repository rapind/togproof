class HomeController < ApplicationController
  layout nil

  def index
    render :file => 'public/404.html', :status => :not_found
  end

  def timestamp
    render :text => Time.now
  end

end
