class HomeController < ApplicationController

  def timestamp
    render :text => Time.zone.now
  end
  
  def index    
  end

end