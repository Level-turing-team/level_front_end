class BackendFacade
  def self.profile_objects(user_id)
    user_circle = BackendService.user_circle(user_id)
    circle_posts= BackendService.circle_posts(user_id)
    tags = BackendService.tags(user_id)
    user_posts = BackendService.user_posts(user_id)
    Profile.new(initialize_object_helper(user_circle, circle_posts, tags, user_posts, user_id))
  end
  def self.initialize_object_helper(user_circle, circle_posts, tags, user_posts, user_id)
    {
      uid: user_id,
      circle: user_circle[:data],
      posts: user_posts[:data],
      tags: tags[:data],
      circle_posts: circle_posts[:data]
    }
  end
  def self.artists_near_me(user_id)
    artists = BackendService.get_artists_near_me(user_id)
    artists[:data].map do |artist|
      Artist.combine(artist)
    end
  end
end