class PrivateGalleryMailer < ActionMailer::Base
  
  def invite(from, to, private_gallery)
    @private_gallery = private_gallery
    @photographer = Photographer.cached
    mail( :from => from, :to => to, :subject => 'Your private gallery is ready!')
  end
  
end