require 'spec_helper'

describe Event do
  
  context "validations" do
    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_least(10).is_at_most(255) }
  end
  
end
