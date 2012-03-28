require 'spec_helper'

describe Photo do

  context "validations" do
    it { should ensure_length_of(:name).is_at_most(100) }
  end
  
  it "should be protected from mass attribute assignment" do
    photo = FactoryGirl.create(:photo)
    time = 2.days.ago
    photo.update_attributes( :created_at => time )
    photo.created_at.to_i.should_not eql(time.to_i)
  end

end
