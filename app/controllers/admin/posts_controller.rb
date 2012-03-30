class Admin::PostsController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show

  def index
    params[:order] = 'title' unless params[:order]
    @posts = Post.order(params[:order])

    if defined?(params[:search][:q]) and params[:search][:q]
      term = Regexp.escape(params[:search][:q])
      @posts = @posts.where(["title ~* ? OR keywords ~* ?", term, term])
    end

    respond_to do |format|
      format.html { @posts = @posts.page(params[:page]) } # page html view
      format.json { @posts = @posts.limit(25) } # limit json view
    end
  end
  
  # Redirect to the collection path on create.
  def create
    create!{ collection_path }
  end

  # Redirect to the collection path on update.
  def update
    update!{ collection_path }
  end

end