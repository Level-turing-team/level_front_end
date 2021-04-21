require 'rails_helper'

# technically this is more of a poro test for Profile
# we would need similar tests for evey other poro
# BackendFacade test should be testing all the methods in our backend facade


RSpec.describe BackendFacade, type: :model do
  describe "class methods" do
    it "profile objects", :vcr do
      @profile = BackendFacade.profile_object(1)

      expect(@profile.class).to eq(Profile)
      expect(@profile.id).to eq(1)
      expect(@profile.username).to eq('the painter man')
      expect(@profile.circle[0].class).to eq(Circle)
      expect(@profile.circle.length).to eq(4)
      expect(@profile.circle_posts[0].class).to eq(Post)
      expect(@profile.circle_posts.length).to eq(7)
      expect(@profile.posts[0].class).to eq(Post)
      # expect(@profile.posts.length).to eq(3)
      expect(@profile.galleries[0].class).to eq(Gallery)
      expect(@profile.galleries.length).to eq(3)
      expect(@profile.tags[0].class).to eq(Tag)
      expect(@profile.tags.length).to eq(2)
      expect(@profile.profile_photo.class).to eq(String)
    end
  end
end
