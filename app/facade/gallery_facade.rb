class GalleryFacade < BackendFacade
  def self.profile_object(user_id)
    galleries = gallery_objects(user_id)
    Profile.new({
      id: user_id,
      galleries: galleries
    })
  end

  def self.create_user_galleries(user_id, name, image, description)
    BackendService.post_user_galleries(user_id, name, image, description)
  end
end
