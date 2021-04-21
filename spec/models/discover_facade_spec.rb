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
  end
end
