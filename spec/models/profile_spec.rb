require 'rails_helper'

RSpec.describe Profile, type: :model do 
  describe "Profile poro" do 
    it "creates a profile poro with the right data" do 
      data = {uid: "12",
              circle: [{:id=>"16", :type=>"profile", :attributes=>{:zipcode=>"80021", :user_id=>10000001, :profile_picture=>"http://www.google.com", :username=>nil}}],
              posts:  [{attributes: {:content=>"This is my post", :id=>10, :link=>"http://www.google.com"}}],
              tags: [{:id=>"16", :type=>"tag", :attributes=>{:name=>"Painter"}}, {:id=>"17", :type=>"tag", :attributes=>{:name=>"Musician"}}],
              circle_posts: [{:id=>"1", :type=>"post", :attributes=>{:content=>"hey did you see that lil nas X video?", :link=>"photoURL.com", :user_id=>10000001}},
                             {:id=>"2", :type=>"post", :attributes=>{:content=>"hey did you see that create meme?", :link=>"photoURL.com", :user_id=>10000001}}]
            }

      @profile = Profile.new(data)

      expect(@profile.uid).to eq("12")
      
      expect(@profile.circle).to be_an(Array)
      expect(@profile.circle.first.class).to eq(Circle)
      expect(@profile.posts).to be_an(Array)
      expect(@profile.posts.first.class).to eq(Post)
      expect(@profile.tags).to be_an(Array)
      expect(@profile.tags.first.class).to eq(Tag)
      expect(@profile.circle_posts).to be_an(Array)
      expect(@profile.circle_posts.first.class).to eq(CirclePost)
      
    end
  end
end