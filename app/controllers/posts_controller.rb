class PostsController < ApplicationController
  inherit_resources
  respond_to :html
  actions :index, :show
end