require 'spec_helper'

describe Page do
  
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(2).is_at_most(20) }
    
    it { should ensure_length_of(:keywords).is_at_least(2).is_at_most(255) }
    
    it { should validate_presence_of(:body) }
    it { should ensure_length_of(:body).is_at_least(10) }
  end
  
  context "cached" do
    it "should return the list of pages" do
      page = FactoryGirl.create(:page)
      FactoryGirl.create(:page)
      Page.cached.size.should be 2
      Page.cached.should include(page)
    end
    
    it "should refresh when a page is modified" do
      page = FactoryGirl.create(:page)
      FactoryGirl.create(:page)
      Page.cached.should include(page)
      page.name = "Changed Name"
      page.save
      Page.cached.collect{ |p| p.name }.should include(page.name)
    end
  end
  
end
