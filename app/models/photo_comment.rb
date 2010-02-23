class PhotoComment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :photographer
  belongs_to :client
  validates_presence_of :body
  validates_length_of :body, :within => 3..2000
  validates_format_of :body, :with => /\A[\w\.\-\+]+\z/
  
  def author
    if self.photographer
      self.photographer.company_name
    elsif self.client
      self.client.name
    end
  end
end
