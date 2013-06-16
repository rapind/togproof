class ContactRequestsController < ApplicationController
  respond_to :html

  def new
    @meta_title = "Contact #{photographer.name}"
    respond_with( @contact_request = ContactRequest.new )
  end

  def create
    @contact_request = ContactRequest.create(params[:contact_request])
    if @contact_request.valid?
      # Send the email
      begin
        ContactRequestMailer.contact(@contact_request).deliver
        respond_with(@contact_request, :location => thanks_contact_requests_path)
      rescue Exception => e
        redirect_to root_path, :alert => "There was a problem submitting a contact request. Please contact me directly at: #{Photographer.cached.email}"
      end
    else
      respond_with @contact_request
    end
  end

  def thanks
  end

end
