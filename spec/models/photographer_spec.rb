require 'spec_helper'

describe Photographer do

  # This should return the minimal set of attributes required
  # to create a valid object.
  def valid_attributes
    { :email => 'fake-user@fake-email.com', :password => 'fakepassword', :name => 'Fake Name' }
  end

  before(:all) do
    # We need an existing object for uniqueness validation tests.
    @photographer = Photographer.create( valid_attributes )
  end

  # ****
  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should ensure_length_of(:email).is_at_least(5).is_at_most(100) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(3).is_at_most(100) }
  it { should ensure_length_of(:phone).is_at_least(7).is_at_most(20) }
  it { should ensure_length_of(:blog_url).is_at_least(10).is_at_most(255) }
  it { should ensure_length_of(:facebook_url).is_at_least(10).is_at_most(255) }
  it { should ensure_length_of(:twitter_url).is_at_least(10).is_at_most(255) }

  it "shoud be protected from mass attribute assignment" do
    time = 2.days.ago
    photographer = Photographer.create( valid_attributes.merge( { :id => 4444, :created_at => time } ) )
    photographer.id.should_not eql(444)
    photographer.created_at.to_i.should_not eql(time.to_i)
  end

end
