require 'rails_helper'

RSpec.describe BackendService, type: :model do
  before :each do
    @user_1 = User.find(1)
    @user = User.create(
      email: 'example@example.com',
      id: '6',
      google_id: '12345',
      zip: '80022',
      first_name: 'john',
      last_name: 'whatever',
      username: 'Pie'
    )
  end

  describe 'Class Methods' do
    it '#user_circle', :vcr do
      @response = BackendService.user_circle(@user_1.id)

      expect(@response[:data].length).to eq(4)
      expect(@response[:data][0]).to be_a(Hash)
      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('profile')
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#circle_posts', :vcr do
      @response = BackendService.circle_posts(@user_1.id)

      expect(@response[:data].length).to eq(7)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('post')
      expect(@response[:data].first[:attributes].keys).to eq([:content, :link, :user_id, :created_at])
    end

    it '#tags', :vcr do
      @response = BackendService.tags(@user_1.id)

      expect(@response[:data].length).to eq(2)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('tag')
      expect(@response[:data].first[:attributes].keys).to eq([:name])
    end

    it '#user_posts', :vcr do
      @response = BackendService.user_posts(@user_1.id)

      expect(@response[:data].length).to eq(3)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('post')
      expect(@response[:data].first[:attributes].keys).to eq([:content, :link, :user_id, :created_at])
    end

    it '#post_user' do
      json = File.read('spec/fixtures/new_profile.json')

      stub_request(:post, "http://localhost:3001/api/v1/profiles?user_id=6&zipcode=80302").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 201, body: json)

      @response = BackendService.post_user('6', '80302')

      expect(@response[:data]).to eq('profile created successfully')
    end

    it '#create_user_post' do
      json = File.read('spec/fixtures/new_post.json')

      stub_request(:post, "http://localhost:3001/api/v1/profiles/1/post?content=THis%20is%20content&link=This%20is%20link&user_id=1").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Content-Length'=>'0',
         'User-Agent'=>'Faraday v1.4.1'
          }).
        to_return(status: 201, body: json)


      @response = BackendService.create_user_post(@user_1.id, 'THis is content', 'This is link')

      expect(@response[:data]).to eq('post created successfully')
    end

    it '#get_user_galleries', :vcr do
      @response = BackendService.get_user_galleries(@user_1.id)

      expect(@response[:data].length).to eq(1)
      expect(@response[:data].first).to be_a(Hash)
      expect(@response[:data].first.keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('gallery')
      expect(@response[:data].first[:attributes].keys).to eq([:user_id, :name, :created_at, :updated_at, :photo_url])
    end

    it '#post_user_galleries', :vcr do
      json = File.read('spec/fixtures/new_gallery.json')
      picture_url = ActionDispatch::Http::UploadedFile.new({
      :filename => 'fluff.jpg',
      :type => 'image/jpeg',
      :tempfile => File.new("#{Rails.root}/spec/fixtures/fluff.jpg")
      })
      @response = BackendService.post_user_galleries(@user.id, 'gallery', picture_url, 'description')
      expect(JSON.parse(@response.body)["data"]).to eq('gallery created successfully')
      @galleries = GalleryFacade.profile_object(@user.id).galleries
      @gallery = @galleries.find {|gall| gall.name == 'gallery' }
      BackendService.destroy_gallery(@user.id, @gallery.id)
    end

    it '#post_gallery_photo', :vcr do
      json = File.read('spec/fixtures/new_photo.json')
      picture_url = fixture_file_upload("spec/fixtures/fluff.jpg", 'img/jpg')
      stub_request(:post, "http://localhost:3001/api/v1/profiles/1/galleries/1/photos?description=description&file=file").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 201, body: json)

      @response = BackendService.post_gallery_photo(@user_1.id, '1', 'description', picture_url)

      expect(JSON.parse(@response.body)["data"]).to eq('photo created successfully')

    end

    it '#get_distance', :vcr do
      @response = BackendService.get_distance(1, 2)

      expect(@response[:data]).to eq(5.19)
    end

    it '#get_artists_near_me', :vcr do
      @response = BackendService.get_artists_near_me(1)

      expect(@response[:data].length < 5).to eq(true)
      expect(@response[:data][0].keys.length).to eq(3)
      expect(@response[:data][0][:type]).to eq('profile')
      expect(@response[:data][0][:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#get_user', :vcr do
      @response = BackendService.get_user(1)

      expect(@response[:data].keys.count).to eq(3)
      expect(@response[:data].keys).to eq([:id, :type, :attributes])
      expect(@response[:data][:type]).to eq('profile')
      expect(@response[:data][:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#get_gallery_photos', :vcr do
      @response = BackendService.get_gallery_photos(1,1)

      expect(@response[:data].length).to eq(3)
      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('photo')
      expect(@response[:data].first[:attributes].keys).to eq([:description, :url, :created_at, :updated_at, :gallery_id])
    end

    it '#get_all_photos', :vcr do
      @response = BackendService.get_all_photos
      expect(@response[:data].length > 22).to eq(true)
      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('photo')
      expect(@response[:data].first[:attributes].keys).to eq([:description, :url, :created_at, :updated_at, :gallery_id])
    end

    it '#profile_search_name', :vcr do
      @response = BackendService.profile_search(1, 'arteest', 'name')

      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('profile')
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#profile_search_tag', :vcr do
      @response = BackendService.profile_search(1, 'painter', 'tag')

      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('profile')
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#profile_search_radius', :vcr do
      @response = BackendService.profile_search(1, '10', 'radius')

      expect(@response[:data][0].keys.count).to eq(3)
      expect(@response[:data].first.keys).to eq([:id, :type, :attributes])
      expect(@response[:data].first[:type]).to eq('profile')
      expect(@response[:data].first[:attributes].keys).to eq([:zipcode, :user_id, :profile_picture, :username])
    end

    it '#post_tag', :vcr do
      @response = BackendService.post_tag('art')
      expect(@response[:data])
    end

    it '#post_profile_tag' do
      json = File.read('spec/fixtures/new_profile_tag.json')

      stub_request(:post, "http://localhost:3001/api/v1/profile/1/tags?tag_id=6").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 201, body: json)

      @response = BackendService.post_profile_tag(1, 6)

      expect(@response[:data]).to eq('tags created successfully')
    end

    it "::create_user_circle" do
      json = File.read('spec/fixtures/new_circle.json')
      stub_request(:post, "http://localhost:3001/api/v1/profile/5/circle?following_id=1&user_id=5").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Content-Length'=>'0',
       	  'User-Agent'=>'Faraday v1.4.1'
           }).
         to_return(status: 201, body: json)

      @response = BackendService.create_user_circle(5, 1)
      expect(@response[:data]).to eq('circle created successfully')
    end
  end
end
