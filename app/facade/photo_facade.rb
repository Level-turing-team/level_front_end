class PhotoFacade < BackendFacade

  def self.create_photos(user_id, gallery_id, description, image_url)
    BackendService.post_gallery_photo(user_id, gallery_id, description, image_url)
  end
end
