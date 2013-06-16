require 'spec_helper'

describe Gallery do
  
  before(:all) do
    @gallery = FactoryGirl.create(:gallery)
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(30) }
    it { should validate_uniqueness_of(:name) }
    
    it { should ensure_length_of(:keywords).is_at_least(2).is_at_most(255) }
    
    it { should ensure_length_of(:description).is_at_least(10) }
  end
  
end
