require 'rails_helper'

RSpec.describe BackendService, type: :model do
  before :each do
  end
  describe 'Class Methods' do
    it '#user_circle', :vcr do
      @response = BackendService.user_circle("10000001")
      
      expect(@response[:data]).to be_an(Array)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq("profile")
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture])
    end
    it '#circle_posts', :vcr do
      @response = BackendService.circle_posts("10000001")

      expect(@response[:data]).to be_an(Array)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq("post")
      expect(@response[:data].first[:attributes].keys).to eq([:content, :link, :user_id])
    end
    it '#tags', :vcr do
      @response = BackendService.tags("10000001")

      expect(@response[:data]).to be_an(Array)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq("tag")
      expect(@response[:data].first[:attributes].keys).to eq([:name])
    end
    it '#user_posts', :vcr do
      @response = BackendService.user_posts("10000001")

      expect(@response[:data]).to be_an(Array)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq("post")
      expect(@response[:data].first[:attributes].keys).to eq([:content, :link, :user_id])
    end
    # xit '#dashboard_photos'
  end
end