require 'rails_helper'

RSpec.describe BackendService, type: :model do
  before :each do
    @user_1 = User.find(1)
  end

  describe 'Class Methods' do
    it '#user_circle', :vcr do
      @response = LocalBackendService.user_circle(@user_1.id)

      expect(@response[:data].length).to eq(4)
      expect(@response[:data][0]).to be_a(Hash)
      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('profile')
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#circle_posts', :vcr do
      @response = LocalBackendService.circle_posts(@user_1.id)

      expect(@response[:data].length).to eq(7)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('post')
      expect(@response[:data].first[:attributes].keys).to eq([:content, :link, :user_id, :created_at])
    end

    it '#tags', :vcr do
      @response = LocalBackendService.tags(@user_1.id)

      expect(@response[:data].length).to eq(2)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('tag')
      expect(@response[:data].first[:attributes].keys).to eq([:name])
    end

    it '#user_posts', :vcr do
      @response = LocalBackendService.user_posts(@user_1.id)

      expect(@response[:data].length).to eq(3)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('post')
      expect(@response[:data].first[:attributes].keys).to eq([:content, :link, :user_id, :created_at])
    end

    it '#post_user' do
      json = File.read('spec/fixtures/new_profile.json')

      stub_request(:post, "http://localhost:3001/api/v1/profiles?profile_picture=http://www.google.com&user_id=6&username=username&zipcode=80302").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 201, body: json)

      @response = LocalBackendService.post_user('6', '80302', 'http://www.google.com', 'username')

      expect(@response[:data]).to eq('profile created successfully')
    end

    # it '#create_user_post' do
    #   json = File.read('spec/fixtures/new_post.json')
    #
    #   stub_request(:post, "http://localhost:3001/api/v1/profiles?profile_picture=http://www.google.com&user_id=6&username=username&zipcode=80302").
    #      with(
    #        headers: {
    #    	  'Accept'=>'*/*',
    #    	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #    	  'Content-Length'=>'0',
    #    	  'User-Agent'=>'Faraday v1.3.0'
    #        }).
    #      to_return(status: 201, body: json)
    #
    #   @response = LocalBackendService.create_user_post(@user_1.id, 'THis is content', 'This is link')
    #
    #   expect(@response[:data]).to eq('post created successfully')
    # end

    it '#get_user_galleries', :vcr do
      @response = LocalBackendService.get_user_galleries(@user_1.id)

      expect(@response[:data].length).to eq(1)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('gallery')
      expect(@response[:data].first[:attributes].keys).to eq([:user_id, :photo_url, :name, :created_at, :updated_at, :photo_count])
    end

    # it '#post_user_galleries', :vcr do
    #   @response = BackendService.post_user_galleries(@user_1.id, 'gallery', 'fjdlkas')
    #
    #   expect(@response[:data]).to eq('gallery created successfully')
    # end
    #
    # it '#post_gallery_photo', :vcr do
    #   @response = BackendService.post_gallery_photo(@user_1.id, '1', 'description', 'url')
    #
    #   expect(@response[:data]).to eq('photo created successfully')
    # end
  end
end
