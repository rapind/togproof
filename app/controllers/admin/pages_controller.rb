class Admin::PagesController < Admin::HomeController
  inherit_resources
  actions :all, :except => :show

  # Redirect to the collection path on create.
  def create
    create!{ collection_path }
  end

  # Redirect to the collection path on update.
  def update
    update!{ collection_path }
  end

end