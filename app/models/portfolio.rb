class Portfolio < ActiveRecord::Base

  # ****
  # Associations
  has_many :portfolio_photos, :dependent => :destroy

  # Multi file uploads
  def portfolio_photos_attrs=(attrs)
    attrs.each { |attr| self.portfolio_photos.build(:photo => attr) }
  end

  # Orderable
  acts_as_list

  # ****
  # Validations
  validates :title, :presence => true, :uniqueness => { :case_sensitive => false }, :length => { :within => 2..100 }
  validates :keywords, :length => { :within => 3..200, :allow_blank => true }
  validates :description, :length => { :within => 5..2000, :allow_blank => true }

  # ****
  # Mass-assignment protection
  attr_accessible :title, :keywords, :description, :cover, :cover_cache, :remove_cover, :portfolio_photos_attrs

  # ****
  # Cover attachment
  mount_uploader :cover, PortfolioUploader

  # Slug for SEO.
  def to_param
    "#{id}-#{title.parameterize}"
  end

end
