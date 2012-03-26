require 'spec_helper'

describe ContactRequest do
  
  context "validations" do
    it { should validate_presence_of(:email) }
    it { should ensure_length_of(:email).is_at_least(5).is_at_most(100) }
    
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(64) }
    
    it { should validate_presence_of(:message) }
    it { should ensure_length_of(:message).is_at_least(10) }
  end
  
end
