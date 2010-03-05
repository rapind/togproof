class Product < ActiveRecord::Base
  belongs_to :photographer
  acts_as_list :scope => :photographer_id
  has_many :product_sizes, :dependent => :destroy, :order => 'position'
  
  has_attached_file :image,
                    :styles => { :original => "", :thumb => "" },
                    :path => ":rails_root/public/attachments/photographer/:photographer_id/products/:id/:style/:basename.:extension",
                    :url => "/attachments/photographer/:photographer_id/products/:id/:style/:basename.:extension",
                    :convert_options => {
                      :original => "-gravity center -thumbnail 660x440^ -extent 660x440",
                      :thumb => "-gravity center -thumbnail 150x100^ -extent 150x100"
                    }
                    
  validates_presence_of :title
  validates_length_of :title, :within => 3..128
  validates_length_of :description, :within => 5..2000, :allow_blank => true
end
