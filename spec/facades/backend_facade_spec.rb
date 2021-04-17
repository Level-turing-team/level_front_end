require 'rails_helper' 

RSpec.describe BackendFacade, type: :model do 
  describe "class methods" do 
    it "profile objects", :vcr do 
      @profile = BackendFacade.profile_objects("10000001")

      expect(@profile.class).to eq(Profile)
      expect(@profile.posts.length).to eq(3)
      expect(@profile.circle_posts.length).to eq(7)
      expect(@profile.circle.length).to eq(4)
      expect(@profile.tags.length).to eq(2)
      expect(@profile.tags.length).to eq(2)
      expect(@profile.uid).to eq("10000001")
    end
  end
end