class ContactRequest < ActiveRecord::Base
  
  # ****
  # Validations
  validates :email, :presence => true, :length => { :within => 5..100 }
  validates :name, :length => { :within => 2..64, :allow_blank => true }
  validates :subject, :presence => true, :length => { :within => 5..128 }

  # ****
  # Mass-assignment protection
  attr_accessible :email, :name, :subject, :body

  # ****
  # Named scopes
  scope :unread, where(:read => false)
  scope :read, where(:read => true)

  # ****
  # Pagination
  paginates_per 16
  
end
