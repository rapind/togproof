require 'spec_helper'

describe Gallery do

  # This should return the minimal set of attributes required
  # to create a valid object.
  def valid_attributes
    { :title => 'Fake Title' }
  end

  # ****
  # Validations
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_least(2).is_at_most(100) }
  it { should ensure_length_of(:description).is_at_least(5).is_at_most(2000) }

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    gallery = Gallery.create( valid_attributes.merge( { :id => 4444, :created_at => time } ) )
    gallery.id.should_not eql(444)
    gallery.created_at.to_i.should_not eql(time.to_i)
  end

  context "expired?" do

    it "should return true if the gallery has expired" do
      gallery = Gallery.create( valid_attributes.merge( { :expires_on => 2.weeks.ago } ) )
      gallery.expired?.should eql(true)
    end

    it "should return false if the gallery has not expired" do
      gallery = Gallery.create( valid_attributes.merge( { :expires_on => 2.weeks.from_now } ) )
      gallery.expired?.should eql(false)
    end

    it "should return false if the gallery doesn't have an expiry set" do
      gallery = Gallery.create( valid_attributes )
      gallery.expired?.should eql(false)
    end

  end

  context "scope" do

    before do
      2.times { Gallery.create( valid_attributes.merge( { :expires_on => 2.weeks.ago } ) ) }
      Gallery.create( valid_attributes.merge( { :expires_on => 2.weeks.from_now } ) )
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
      gallery = Gallery.create( valid_attributes )
      gallery.token.should_not eql(nil)
    end
  end

end
