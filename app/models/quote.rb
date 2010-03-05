class Quote < ActiveRecord::Base
  belongs_to :photographer
  acts_as_list :scope => :photographer_id
  
  validates_presence_of :author, :body
  validates_length_of :author, :within => 5..80
  validates_length_of :body, :within => 5..200
  validates_uniqueness_of :body
  
end
