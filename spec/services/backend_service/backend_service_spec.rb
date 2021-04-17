require 'rails_helper'

RSpec.describe BackendService, type: :model do
  before :each do
    @user = User.create(first_name: "J", last_name: "b", email: "aa@a.com", username: "la", picture_url: "spec/fixtures/fluff.jpg", zip: "80000")
  end
  describe 'Class Methods' do
    it '#user_circle', :vcr do
      @response = BackendService.user_circle("10000001")
      
      expect(@response[:data]).to be_an(Array)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq("profile")
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
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
    
    it '#post_user' do
      VCR.use_cassette('cassette_1') do
        @response = BackendService.post_user(@user.id, @user.zip, @user.picture_url, @user.username)
        expect(@response[:data]).to eq("profile created successfully")
      end
    end
    
    it "#create_user_post" do
      VCR.use_cassette('cassette_2') do
        BackendService.post_user(@user.id, @user.zip, @user.picture_url, @user.username)
      end
      VCR.use_cassette('cassette_3') do
        @response = BackendService.create_user_post(@user.id, 'THis is content', 'This is link')
        expect(@response[:data]).to eq("post created successfully")
      end
    end

    it "#get_user_galleries", :vcr do
      BackendService.post_user(@user.id, @user.zip, @user.picture_url, @user.username)
      @response = BackendService.get_user_galleries(@user.id)
      expect(@response[:data]).to eq([])
    end
    
    it "#post_user_galleries", :vcr do
      BackendService.post_user(@user.id, @user.zip, @user.picture_url, @user.username)
      @response = BackendService.post_user_galleries(@user.id, "gallery", "fjdlkas")
      expect(@response[:data]).to eq('gallery created successfully')
    end

    it '#post_gallery_photo', :vcr do
      BackendService.post_user(@user.id, @user.zip, @user.picture_url, @user.username)
      BackendService.post_user_galleries(@user.id, "gallery", "fjdlkas")
      @gallery_id = BackendService.get_user_galleries(@user.id)[:data][0][:id]
      @response = BackendService.post_gallery_photo(@user.id, @gallery_id, "description", "url")
      expect(@response[:data]).to eq("photo created successfully")
    end
  end
end