require 'spec_helper'

describe PrivateGalleryEvent do
  
  context "validations" do
    it { should validate_presence_of(:private_gallery) }
    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_least(5).is_at_most(128) }
  end
  
end
