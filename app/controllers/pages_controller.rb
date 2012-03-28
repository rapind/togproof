class PagesController < ApplicationController
  inherit_resources
  respond_to :html
  actions :show
end