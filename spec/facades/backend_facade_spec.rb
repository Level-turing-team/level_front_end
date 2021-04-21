require 'rails_helper'

# technically this is more of a poro test for Profile
# we would need similar tests for evey other poro
# BackendFacade test should be testing all the methods in our backend facade


RSpec.describe BackendFacade, type: :model do
  before :each do
    @user = User.find(1)
  end


  describe "class methods" do
    # it "profile objects", :vcr do
    #   @profile = BackendFacade.profile_object(1)
    #
    #   expect(@profile.class).to eq(Profile)
    #   expect(@profile.id).to eq(1)
    #   expect(@profile.username).to eq('the painter man')
    #   expect(@profile.circle[0].class).to eq(Circle)
    #   expect(@profile.circle.length).to eq(4)
    #   expect(@profile.circle_posts[0].class).to eq(Post)
    #   expect(@profile.circle_posts.length).to eq(7)
    #   expect(@profile.posts[0].class).to eq(Post)
    #   expect(@profile.posts.length).to eq(3)
    #   expect(@profile.galleries[0].class).to eq(Gallery)
    #   expect(@profile.galleries.length).to eq(1)
    #   expect(@profile.tags[0].class).to eq(Tag)
    #   expect(@profile.tags.length).to eq(2)
    #   expect(@profile.profile_photo.class).to eq(String)
    # end

    it '#photo_objects', :vcr do
      @photos = BackendFacade.photo_objects(@user.id, 1)

      expect(@photos.size).to eq(3)
      expect(@photos[0].gallery_id).to eq(1)
      expect(@photos[0].description).to eq('pic 1')
      expect(@photos[0].url).to eq('http:www.google.com')
    end

    it '#gallery_objects', :vcr do
      @galleries = BackendFacade.gallery_objects(@user.id)

      expect(@galleries.size).to eq(1)
      expect(@galleries[0].id).to eq('1')
      expect(@galleries[0].name).to eq('photos from cali')
      expect(@galleries[0].created_at).to eq('2021-04-18T16:28:20.884Z')
      expect(@galleries[0].photos.size).to eq(3)
      expect(@galleries[0].photos[0].class).to eq(Photo)
    end

    it '#tag_objects', :vcr do
      @tags = BackendFacade.tag_objects(@user.id)

      expect(@tags.size).to eq(2)
      expect(@tags[0].class).to eq(Tag)
      expect(@tags[0].name).to eq('Painter')
    end

    it '#user_circle_objects', :vcr do
      @circle = BackendFacade.user_circle_objects(@user.id)

      expect(@circle.size).to eq(4)
      expect(@circle[0].class).to eq(Circle)
      expect(@circle[0].profile_picture).to eq('http://www.google.com')
      expect(@circle[0].username).to eq('korn')
    end

    it '#post_objects', :vcr do
      @posts = BackendFacade.post_objects(BackendService.user_posts(@user.id))

      expect(@posts.size).to eq(6)
      expect(@posts[0].content).to eq('hey did you see that lil nas X video?')
      expect(@posts[0].created_at).to eq('2021-04-18T16:28:20.859Z')
      expect(@posts[0].link).to eq('photoURL.com')
      expect(@posts[0].user).to eq(@user)
    end
  end
end
