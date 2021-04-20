require 'rails_helper'

RSpec.describe Profile, type: :model do 
  describe "Profile poro" do 
    it "creates a profile poro with the right data" do 
      data = {id: "12",
              circle: "whatever you want",
              posts: "this is a post of something",
              tags: "this is supposed to be a medium",
              circle_posts: "this is your homies post"
            }
      @profile = Profile.new(data)

      expect(@profile.id).to eq("12")
      expect(@profile.circle).to eq("whatever you want")
      expect(@profile.posts).to eq("this is a post of something")
      expect(@profile.tags).to eq("this is supposed to be a medium")
      expect(@profile.circle_posts).to eq("this is your homies post")
    end
  end
end