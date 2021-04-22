require 'rails_helper'

RSpec.describe DiscoverFacade do
  describe "class methods" do
    it "#profile_object", :vcr do
      result = DiscoverFacade.profile_object(1)
      expect(result).to be_a(Profile)
      expect(result.profile_photo).to eq("http://www.google.com")
      expect(result.username).to eq("the painter man")
      expect(result.zipcode).to eq("80301")
      expect(result.id).to eq(1)
    end

    it "#recent_photo_objects", :vcr do
      result = DiscoverFacade.recent_photo_objects
      expect(result.first).to be_a(Photo)
      expect(result.length).to eq(22)
      expect(result.first.description).to eq("pic 1")
      expect(result.first.gallery_id).to eq(8)
      expect(result.first.url).to eq("http:www.google.com")
    end

    it "#search_user_objects", :vcr do
      result = DiscoverFacade.search_user_objects(1, "slipknot", "name")

      expect(result.first).to be_a(Profile)
      expect(result.first.profile_photo).to eq("http://www.google.com")
      expect(result.first.username).to eq("slipknot")
      expect(result.first.zipcode).to eq("80304")
      expect(result.first.id).to eq("3")
    end

    it "artists_near_me", :vcr do
      result = DiscoverFacade.artists_near_me(1)
      expect(result.first).to be_an_instance_of(Profile)
      expect(result.length).to eq(4)
      expect(result.first.username).to eq("korn")
      expect(result.first.zipcode).to eq("80305")
    end
  end
end
