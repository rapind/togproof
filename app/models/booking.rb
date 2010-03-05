class Booking < ActiveRecord::Base
  belongs_to :photographer
  belongs_to :client
  has_many :photos, :order => 'title', :dependent => :destroy
  has_many :photo_comments, :through => :photos, :order => 'photo_comments.created_at'
  validates_presence_of :title
  validates_length_of :title, :within => 2..128
  
  named_scope :active, :conditions => ['expires_on IS NULL OR expires_on > ?', Date.today]
  named_scope :expired, :conditions => ['expires_on <= ?', Date.today]
  
  def expired?
    if self.expires_on and self.expires_on < Date.today
      return true
    else
      return false
    end
  end
end
