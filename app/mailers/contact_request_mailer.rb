class ContactRequestMailer < ActionMailer::Base
  
  def contact(contact_request)
    @contact_request = contact_request
    @photographer = Photographer.cached
    mail( :from => @photographer.email, :to => @photographer.email, :subject => "Grokphoto Contact Request: #{@contact_request.name}")
  end
  
end