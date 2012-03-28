require 'spec_helper'

describe PrivateGallery do

  before(:all) do
    @private_gallery = FactoryGirl.create(:private_gallery)
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(100) }
  end

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    @private_gallery.update_attributes( :created_at => time )
    @private_gallery.created_at.to_i.should_not eql(time.to_i)
  end

  context "expired?" do
    it "should return true if the private_gallery has expired" do
      @private_gallery.expires_on = 2.weeks.ago
      @private_gallery.expired?.should eql(true)
    end

    it "should return false if the private_gallery has not expired" do
      @private_gallery.expires_on = 2.weeks.from_now
      @private_gallery.expired?.should eql(false)
    end

    it "should return false if the private_gallery doesn't have an expiry set" do
      @private_gallery.expires_on = nil
      @private_gallery.expired?.should eql(false)
    end
  end

  context "scope" do
    before(:all) do
      2.times { FactoryGirl.create(:private_gallery, :expires_on => 2.weeks.ago) }
      @private_gallery.update_attribute(:expires_on, 2.weeks.from_now)
    end

    it "active should return all active private_galleries" do
      PrivateGallery.active.size.should eql(1)
    end

    it "expired should return all expired private_galleries" do
      PrivateGallery.expired.size.should eql(2)
    end
  end

  context "unguessable token" do
    it "should be generated upon creation" do
      private_gallery = FactoryGirl.create(:private_gallery)
      private_gallery.token.should_not eql(nil)
    end
  end

end
