class Quote < ActiveRecord::Base
  acts_as_list
  
  validates_presence_of :author, :body
  validates_length_of :author, :within => 5..80
  validates_format_of :author, :with => /\A[\w\.\-\+]+\z/
  validates_length_of :body, :within => 5..200
  validates_uniqueness_of :body
  validates_format_of :body, :with => /\A[\w\.\-\+]+\z/
  
end
