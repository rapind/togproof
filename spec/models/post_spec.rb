require 'spec_helper'

describe Post do
  
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(64) }
    
    it { should ensure_length_of(:keywords).is_at_least(2).is_at_most(255) }
    
    it { should validate_presence_of(:body) }
    it { should ensure_length_of(:body).is_at_least(10) }
  end
  
  context "recent" do
    it "should return the list of recent posts" do
      post = FactoryGirl.create(:post)
      FactoryGirl.create(:post)
      Post.recent.size.should be 2
      Post.recent.should include(post)
    end
    
    it "should refresh the cache when a post is modified" do
      post = FactoryGirl.create(:post)
      FactoryGirl.create(:post)
      Post.recent.should include(post)
      post.title = "Changed Title"
      post.save
      Post.recent.collect{ |p| p.title }.should include(post.title)
    end
  end
  
end
