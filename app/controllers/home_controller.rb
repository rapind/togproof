class HomeController < ApplicationController

  def index
  end

  def timestamp
    render :text => Time.now
  end

end
