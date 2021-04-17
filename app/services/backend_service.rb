class BackendService

  # def self.user_profile_create
  #   Faraday.post("https://lit-atoll-80185.herokuapp.com/api/v1/profile")
  # end

  # def self.user_profile_update
  #   Faraday.patch("https://lit-atoll-80185.herokuapp.com/api/v1/profile")
  # end

  def self.get_artists_near_me(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/discover")
    parse(response)
  end
  

  def self.connection
    conn = Faraday.new(url: "https://lit-atoll-80185.herokuapp.com")
  end

  def self.post_profile_picture(user_id, picture_url)
    connection.post("https://lit-atoll-80185.herokuapp.com/api/v1/photos",
    user_id: "#{user_id}",
    picture_url: "#{picture_url}") 
  end

  def self.user_circle(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/circle")
    parse(response)
  end

  def self.circle_posts(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/circle/posts")
    parse(response)
  end

  def self.tags(user_id)
    response = connection.get("/api/v1/profile/#{user_id}/tags")
    parse(response)
  end

  def self.user_posts(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/post")
    parse(response)
  end

  def self.dashboard_photos(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/circle/photos")
    parse(response)
  end


  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_distance(current_user_id,requested_user_id)
    response = connection.get("/api/v1/distance?current_user=#{current_user_id}&user=#{requested_user_id}")
    parse(response)
  end
end
