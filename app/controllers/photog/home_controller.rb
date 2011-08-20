class Photog::HomeController < ApplicationController
  inherit_resources
  layout 'photog'
  before_filter :authenticate_photographer!
end