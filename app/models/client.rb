class Client < ActiveRecord::Base
  acts_as_authentic do |c|
    c.require_password_confirmation = false
  end
  belongs_to :photographer
  has_many :bookings, :dependent => :destroy, :order => 'expires_on ASC, created_at DESC'
  has_many :photo_comments, :dependent => :destroy, :order => 'created_at'
  
  def deliver_password_reset_instructions!(config)
    reset_perishable_token!  
    Notifier.deliver_client_password_reset_instructions(config, self)
  end
  
  def deliver_invite!(config, custom_message)
    reset_perishable_token!
    Notifier.deliver_client_invite(config, self, custom_message)
  end
  
  def has_active_bookings?
    bookings.active.size > 0
  end
  
end
