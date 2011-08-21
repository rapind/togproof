require 'spec_helper'

describe Page do

  before(:all) do
    # We need an existing object for uniqueness validation tests.
    @page = FactoryGirl.create(:page)
  end

  # ****
  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should ensure_length_of(:title).is_at_least(2).is_at_most(100) }
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_least(10) }
  it { should ensure_length_of(:keywords).is_at_least(3).is_at_most(200) }
  it { should ensure_length_of(:summary).is_at_least(5).is_at_most(250) }

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    @page.update_attributes( :created_at => time )
    @page.created_at.to_i.should_not eql(time.to_i)
  end

  context "to_param" do
    it "should return an SEO friendly slug" do
      @page.to_param.should eql("#{@page.id}-#{@page.title.parameterize}")
    end
  end

end