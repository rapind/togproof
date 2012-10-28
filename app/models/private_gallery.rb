class PrivateGallery < ActiveRecord::Base

  # Associations
  has_many :photos, :as => :photoable, :dependent => :destroy, :order => :position

  # Virtual attribute for sending email invitations.
  attr_accessor :email

  # Validations
  validates :name, :presence => true, :length => { :within => 2..100 }
  validates :email, :length => { :within => 5..128, :allow_blank => true }

  # Mass-assignment protection
  attr_accessible :name, :email, :expires_on, :photos_attrs

  # Named scopes
  scope :active, where("expires_on >= ?", Time.now)
  scope :expired, where("expires_on < ?", Time.now)

  # Multi-file uploads
  def photos_attrs=(attrs)
    attrs.each { |attr| self.photos.build(:photo => attr) }
  end

  # Determine if the private gallery has expired.
  def expired?
    (self.expires_on and self.expires_on < Date.today) || false
  end

  # Callbacks
  before_create :build_token
  after_create :log_create_event
  after_update :log_update_event
  after_destroy :log_destroy_event

  private #----

    # Secures private galleries by using an unguessable token.
    def build_token
      self.token = Devise.friendly_token
    end

    def log_create_event
      Event.create(:description => "Created private gallery: #{name}")
    end

    def log_update_event
      Event.create(:description => "Changed private gallery: #{name}")
    end

    def log_destroy_event
      Event.create(:description => "Deleted private gallery: #{name}")
    end

end