class Admin::HomeController < ApplicationController
  layout 'admin'
  before_filter :authenticate_photographer!
  
  def index
    @events = Event.limit()
  end
  
end