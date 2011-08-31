class Admin::GalleriesController < Admin::HomeController
  actions :all, :except => :show
  respond_to :html
  has_scope :page, :default => 1

  # Set a default expire date
  def new
    new! { @gallery.expires_on = 4.weeks.from_now }
  end

  # Redirect to the edit path on create.
  def create
    create!{ edit_resource_path }
  end

  # Redirect to the edit path on update.
  def update
    update!{ edit_resource_path }
  end

end