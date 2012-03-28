class ContactRequestsController < ApplicationController
  inherit_resources
  respond_to :html
  actions :new, :create
  
  # Redirect to the edit path on update instead of show
  def update
    update!{ edit_admin_photographer_path }
  end
  
  def thanks
  end

end