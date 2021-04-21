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
    end

    it "#search_user_objects", :vcr do
      result = DiscoverFacade.search_user_objects(1, "slipknot", "name")
      # require "pry"; binding.pry
      expect(result).to be_a(Profile)
      expect(result.profile_photo).to eq("http://www.google.com")
      expect(result.username).to eq("slipknot")
      expect(result.zipcode).to eq("80301")
      expect(result.id).to eq(1)
    end

    it "artists_near_me", :vcr do
      result = DiscoverFacade.artists_near_me(1)

      expect(result).to be_an_instance_of(Profile)
      expect(result.length).to eq(4)
      expect(result.first.username).to eq("korn")
      expect(result.first.zipcode).to eq("80305")

      require "pry"; binding.pry
    end
  end
end
