class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.order('created_at desc').page(params[:page]).per(5)
    respond_with @posts
  end

  def show
    @post = Post.find params[:id]
    @meta_title = @post.meta_title || @post.title
    @keywords = @post.keywords
    @meta_description = @post.description
    respond_with @post
  end

end
