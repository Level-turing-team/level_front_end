class DashboardFacade < BackendFacade
  def self.profile_object(user_id)
    user_circle = user_circle_objects(user_id)
    circle_posts = post_objects(BackendService.circle_posts(user_id))
    user_posts = post_objects(BackendService.user_posts(user_id))
    profile_photo = BackendService.get_user(user_id)[:data][:attributes][:profile_picture]
    username = BackendService.get_user(user_id)[:data][:attributes][:username]
    tags = tag_objects(user_id)
    galleries = gallery_objects(user_id)
    Profile.new({
      id: user_id,
      username: username,
      circle: user_circle,
      circle_posts: circle_posts,
      profile_photo: profile_photo,
      tags: tags,
      galleries: galleries
    })
  end
end
