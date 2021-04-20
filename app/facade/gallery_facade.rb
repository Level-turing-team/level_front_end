class GalleryFacade < BackendFacade
  def self.profile_object(user_id)
    galleries = gallery_objects(user_id)
    Profile.new({
      id: user_id,
      galleries: galleries
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
                created_at: gallery[:attributes][:created_at],
                updated_at: gallery[:attributes][:updated_at],
                photos: photos
              }
      Gallery.new(data)
    end
  end

  def self.gallery_initialize_helper(user_id, gallery_id)

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
end
