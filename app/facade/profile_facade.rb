class ProfileFacade < BackendFacade
  def self.profile_object(user_id)
    tags = tag_objects(user_id)
    user_posts = post_objects(BackendService.user_posts(user_id))
    galleries = gallery_objects(user_id)
    profile_photo = BackendService.get_user(user_id)[:data][:attributes][:profile_picture]
    username = BackendService.get_user(user_id)[:data][:attributes][:username]
    Profile.new({
      id: user_id,
      username: username,
      posts: user_posts,
      tags: tags,
      galleries: galleries,
      profile_photo: profile_photo
    })
  end
end
