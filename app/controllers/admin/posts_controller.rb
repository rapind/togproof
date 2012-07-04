class Admin::PostsController < Admin::HomeController
  respond_to :json, :html
  before_filter :load_resource, :only => [:edit, :update, :destroy]

  def index
    params[:order] = 'title' unless params[:order]
    @posts = Post.order(params[:order])

    if defined?(params[:search][:q]) and params[:search][:q]
      term = Regexp.escape(params[:search][:q])
      @posts = @posts.where(["title ~* ? OR keywords ~* ?", term, term])
    end

    @posts = @posts.page(params[:page])
    respond_with :admin, @posts
  end

  def new
    respond_with( :admin, @post = Post.new )
  end

  def create
    @post = Post.create(params[:post])
    respond_with :admin, @post
  end

  def edit
    respond_with :admin, @post
  end

  def update
    @post.update_attributes params[:post]
    respond_with :admin, @post
  end

  def destroy
    @post.destroy
    respond_with :admin, @post
  end

  private #----

    def load_resource
      @post = Post.find params[:id]
    end

end