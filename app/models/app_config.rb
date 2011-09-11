class AppConfig
  #include ActiveModel::Naming
  extend ActiveModel::Naming
  include ActiveModel::Validations
  include ActiveModel::Serialization
  include ActiveModel::Conversion

  attr_accessor :name, :phone, :blog_url, :facebook_url, :twitter_url, :conversion_code

  validates :name, :presence => true, :length => { :within => 3..100 }
  validates :phone, :length => { :within => 7..20, :allow_blank => true }
  validates :blog_url, :length => { :within => 10..255, :allow_blank => true }
  validates :facebook_url, :length => { :within => 10..255, :allow_blank => true }
  validates :twitter_url, :length => { :within => 10..255, :allow_blank => true }
  validates :conversion_code, :length => { :within => 10..9000, :allow_blank => true }

  def initialize(attributes = {})
    attributes.each do |key, value|  
      send("#{key}=", value)  
    end 
  end

  def save
    puts "Saving..."
  end

  def save!
    save
  end

end
