class GalleryMailer < ActionMailer::Base
  
  def invite(from, to, gallery)
    @gallery = gallery
    @photographer = Photographer.cached
    mail( :from => from, :to => to, :subject => 'Your gallery is ready!')
  end
  
end