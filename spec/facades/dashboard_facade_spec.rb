require 'rails_helper'

RSpec.describe DashboardFacade, type: :model do
  describe 'class methods' do
    it '#profile_object', :vcr do
      @profile = DashboardFacade.profile_object(1)

      expect(@profile.class).to eq(Profile)
      expect(@profile.circle.class).to eq(Array)
      expect(@profile.circle.first.class).to eq(Circle)
      expect(@profile.circle_posts.class).to eq(Array)
      expect(@profile.circle_posts.first.class).to eq(Post)
      expect(@profile.id).to eq(1)
      expect(@profile.profile_photo).to eq("http://www.google.com")
      expect(@profile.username).to eq("the painter man")
    end
  end
end
