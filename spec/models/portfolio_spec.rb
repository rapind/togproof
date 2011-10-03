require 'spec_helper'

describe Portfolio do

  before(:all) do
    # We need an existing object for uniqueness validation tests.
    @portfolio = FactoryGirl.create(:portfolio)
  end

  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(100) }
    it { should ensure_length_of(:keywords).is_at_least(3).is_at_most(200) }
    it { should ensure_length_of(:description).is_at_least(5).is_at_most(2000) }
  end

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    @portfolio.update_attributes( :created_at => time )
    @portfolio.created_at.to_i.should_not eql(time.to_i)
  end

  context "to_param" do
    it "should return an SEO friendly slug" do
      @portfolio.to_param.should eql("#{@portfolio.id}-#{@portfolio.title.parameterize}")
    end
  end

end
