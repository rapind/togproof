require 'spec_helper'

describe PortfolioPhoto do

  # ****
  # Validations
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(100) }

  it "shoud be protected from mass attribute assignment" do
    portfolio_photo = FactoryGirl.create(:portfolio_photo)
    time = 2.days.ago
    portfolio_photo.update_attributes( :created_at => time )
    portfolio_photo.created_at.to_i.should_not eql(time.to_i)
  end

end
