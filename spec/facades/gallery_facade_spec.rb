require 'rails_helper'

RSpec.describe GalleryFacade, type: :model do
  describe 'class methods' do
    it '#profile_object', :vcr do
      @profile = GalleryFacade.profile_object(1)

      expect(@profile.class).to eq(Profile)
      expect(@profile.galleries.class).to eq(Array)
      expect(@profile.galleries.first.class).to eq(Gallery)
    end
  end
end
