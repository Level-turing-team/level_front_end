class BackendFacade
  def self.profile_object(user_id)
    user_circle = user_circle_objects(user_id)
    circle_posts = post_objects(BackendService.circle_posts(user_id))
    tags = tag_objects(user_id)
    user_posts = post_objects(BackendService.user_posts(user_id))
    galleries = gallery_objects(user_id)
    profile_photo = BackendService.get_user(user_id)[:data][:attributes][:profile_picture]
    username = BackendService.get_user(user_id)[:data][:attributes][:username]
    Profile.new({
      id: user_id,
      username: username,
      circle: user_circle,
      posts: user_posts,
      tags: tags,
      circle_posts: circle_posts,
      galleries: galleries,
      profile_photo: profile_photo
    })
  end

  def self.photo_objects(user_id, gallery_id)
    BackendService.get_gallery_photos(user_id, gallery_id)[:data].map do |data|
      Photo.new(data)
    end
  end

  def self.gallery_objects(user_id)
    BackendService.get_user_galleries(user_id)[:data].map do |gallery|
      photos = photo_objects(user_id, gallery[:id])
      data = {
                id: gallery[:id],
                user_id: gallery[:attributes][:user_id],
                name: gallery[:attributes][:name],
                photo_url: gallery[:attributes][:photo_url],
                created_at: gallery[:attributes][:created_at],
                updated_at: gallery[:attributes][:updated_at],
                photos: photos
              }
      Gallery.new(data)
    end
  end

  def self.tag_objects(user_id)
    BackendService.tags(user_id)[:data].map do |data|
      Tag.new(data)
    end
  end

  def self.user_circle_objects(user_id)
    BackendService.user_circle(user_id)[:data].map do |data|
      Circle.new(data)
    end
  end

  def self.artists_near_me(user_id)
    artists = BackendService.get_artists_near_me(user_id)
    artists[:data].map do |artist|
      Artist.combine(artist)
    end
  end

  def self.post_objects(data)
    data[:data].map do |post_data|
      Post.new(post_data)
    end
  end

  def self.find_circle(circle_data)
    circle_data.map do |profile|
      User.find(profile[:attributes][:user_id])
    end
  end

  def self.create_profile_gallery_and_photo(user_id, picture_url)
    #create profile_gallery & profile_photo
    BackendService.post_user_galleries(user_id, 'Profile', picture_url)
  end

  def self.create_profile(user_id, user_zipcode, profile_picture, username)
    BackendService.post_user(user_id, user_zipcode, profile_picture, username)
  end
end
