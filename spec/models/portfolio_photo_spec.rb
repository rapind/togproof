require 'spec_helper'

describe PortfolioPhoto do

  # This should return the minimal set of attributes required
  # to create a valid object.
  def valid_attributes
    { :portfolio_id => 1, :title => 'Fake Title' }
  end

  # ****
  # Validations
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(100) }

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    portfolio_photo = PortfolioPhoto.create( valid_attributes.merge( { :id => 4444, :created_at => time } ) )
    portfolio_photo.id.should_not eql(444)
    portfolio_photo.created_at.to_i.should_not eql(time.to_i)
  end

end
