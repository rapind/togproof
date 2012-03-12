require 'spec_helper'

describe Gallery do

  before(:all) do
    @gallery = FactoryGirl.create(:gallery)
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(100) }
  end

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    @gallery.update_attributes( :created_at => time )
    @gallery.created_at.to_i.should_not eql(time.to_i)
  end

  context "expired?" do
    it "should return true if the gallery has expired" do
      @gallery.expires_on = 2.weeks.ago
      @gallery.expired?.should eql(true)
    end

    it "should return false if the gallery has not expired" do
      @gallery.expires_on = 2.weeks.from_now
      @gallery.expired?.should eql(false)
    end

    it "should return false if the gallery doesn't have an expiry set" do
      @gallery.expires_on = nil
      @gallery.expired?.should eql(false)
    end
  end

  context "scope" do
    before(:all) do
      2.times { FactoryGirl.create(:gallery, :expires_on => 2.weeks.ago) }
      @gallery.update_attribute(:expires_on, 2.weeks.from_now)
    end

    it "active should return all active galleries" do
      Gallery.active.size.should eql(1)
    end

    it "expired should return all expired galleries" do
      Gallery.expired.size.should eql(2)
    end
  end

  context "unguessable token" do
    it "should be generated upon creation" do
      gallery = FactoryGirl.create(:gallery)
      gallery.token.should_not eql(nil)
    end
  end

end
