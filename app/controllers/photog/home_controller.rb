class Photog::HomeController < InheritedResources::Base
  layout 'photog'
  before_filter :authenticate_photographer!
end