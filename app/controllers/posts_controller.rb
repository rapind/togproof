class PostsController < ApplicationController
  inherit_resources
  respond_to :html
  actions :index, :show
  
  private #----
  
    def collection
      @posts ||= end_of_association_chain.page(params[:page]).per(5)
    end
  
end