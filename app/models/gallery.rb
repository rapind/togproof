class Gallery < ActiveRecord::Base

  # ****
  # Pagination
  paginates_per 16

  # ****
  # Associations
  has_many :photos, :dependent => :destroy

  # Multi-file uploads
  def photos_attrs=(attrs)
    attrs.each { |attr| self.photos.build(:image => attr) }
  end

  # ****
  # Validations
  validates :title, :presence => true, :length => { :within => 2..100 }
  validates :description, :length => { :within => 5..2000, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :title, :description, :expires_on, :photos_attrs

  # ****
  # Named scopes
  scope :active, where("expires_on >= ?", Time.now)
  scope :expired, where("expires_on < ?", Time.now)

  # Determine if the gallery has expired.
  def expired?
    (self.expires_on and self.expires_on < Date.today) || false
  end

  before_create :build_token

  private #----

    # Secures galleries by using an unguessable token.
    def build_token
      self.token = Devise.friendly_token
    end

end