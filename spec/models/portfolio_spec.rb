require 'spec_helper'

describe Portfolio do

  # This should return the minimal set of attributes required
  # to create a valid object.
  def valid_attributes
    { :title => 'Fake Title' }
  end

  before(:all) do
    # We need an existing object for uniqueness validation tests.
    @portfolio = Portfolio.create( valid_attributes )
  end

  # ****
  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should ensure_length_of(:title).is_at_least(2).is_at_most(100) }
  it { should ensure_length_of(:keywords).is_at_least(3).is_at_most(200) }
  it { should ensure_length_of(:description).is_at_least(5).is_at_most(2000) }

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    portfolio = Portfolio.create( valid_attributes.merge( { :id => 4444, :created_at => time } ) )
    portfolio.id.should_not eql(444)
    portfolio.created_at.to_i.should_not eql(time.to_i)
  end

  context "to_param" do
    it "should return an SEO friendly slug" do
      @portfolio.to_param.should eql("#{@portfolio.id}-#{@portfolio.title.parameterize}")
    end
  end

end
