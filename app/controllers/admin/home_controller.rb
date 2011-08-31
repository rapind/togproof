class Admin::HomeController < InheritedResources::Base
  layout 'admin'
  before_filter :authenticate_photographer!
end