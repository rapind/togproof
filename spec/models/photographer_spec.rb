require 'spec_helper'

describe Photographer do

  before(:all) do
    # We need an existing object for uniqueness validation tests.
    @photographer = FactoryGirl.create(:photographer)
  end

  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(3).is_at_most(80) }
    it { should ensure_length_of(:tagline).is_at_least(3).is_at_most(128) }
    it { should ensure_length_of(:description).is_at_least(10).is_at_most(255) }
    it { should ensure_length_of(:phone).is_at_least(7).is_at_most(20) }
    it { should ensure_length_of(:blog_url).is_at_least(10).is_at_most(512) }
    it { should ensure_length_of(:facebook_url).is_at_least(10).is_at_most(255) }
    it { should ensure_length_of(:twitter_url).is_at_least(10).is_at_most(255) }
    it { should ensure_length_of(:disqus_short_name).is_at_least(2).is_at_most(64) }
  end

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    # created_at should be assigned automatically and not be accessible
    @photographer.update_attributes( :created_at => time )
    @photographer.created_at.to_i.should_not eql(time.to_i)
  end

end
