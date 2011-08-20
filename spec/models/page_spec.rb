require 'spec_helper'

describe Page do

  # This should return the minimal set of attributes required
  # to create a valid object.
  def valid_attributes
    { :title => 'Fake Title', :body => 'Fake body is at least 10 characters long.' }
  end

  before(:all) do
    # We need an existing object for uniqueness validation tests.
    @page = Page.create( valid_attributes )
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
    page = Page.create( valid_attributes.merge( { :id => 4444, :created_at => time } ) )
    page.id.should_not eql(444)
    page.created_at.to_i.should_not eql(time.to_i)
  end

  context "to_param" do
    it "should return an SEO friendly slug" do
      @page.to_param.should eql("#{@page.id}-#{@page.title.parameterize}")
    end
  end

end