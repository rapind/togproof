class Admin::HomeController < ApplicationController
  # this removes the layout for all ajax requests
  layout proc { |controller| controller.request.xhr? ? nil : 'admin' }
  
  before_filter :require_photographer
end