class PostsController < ApplicationController
  respond_to :html

  def index
    @meta_title = "Blog | #{photographer.name}"
    @posts = Post.order('created_at desc').page(params[:page]).per(5)
    respond_with @posts
  end

  def show
    @post = Post.find params[:id]
    @meta_title = @post.meta_title.blank? ? "#{@post.title} | #{photographer.name}" : @post.meta_title
    @keywords = @post.keywords
    @meta_description = @post.meta_description
    respond_with @post
  end

end
