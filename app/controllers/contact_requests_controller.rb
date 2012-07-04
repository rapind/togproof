class ContactRequestsController < ApplicationController
  respond_to :html

  def new
    respond_with( @contact_request = ContactRequest.new )
  end

  def create
    @contact_request = ContactRequest.create(params[:contact_request])
    if @contact_request.valid?
      respond_with(@contact_request, :location => thanks_contact_requests_path)
    else
      respond_with @contact_request
    end
  end

  def thanks
  end

end
