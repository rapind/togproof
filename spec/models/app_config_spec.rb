require 'spec_helper'

describe AppConfig do

  #before(:all) do
  #  @app_config = FactoryGirl.create(:app_config)
  #end

  #it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(3).is_at_most(100) }
  it { should ensure_length_of(:phone).is_at_least(7).is_at_most(20) }
  it { should ensure_length_of(:blog_url).is_at_least(10).is_at_most(255) }
  it { should ensure_length_of(:facebook_url).is_at_least(10).is_at_most(255) }
  it { should ensure_length_of(:twitter_url).is_at_least(10).is_at_most(255) }
  it { should ensure_length_of(:conversion_code).is_at_least(10).is_at_most(9000) }

 
end
