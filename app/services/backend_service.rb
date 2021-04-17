class BackendService
  def self.connection
    conn = Faraday.new(url: "https://lit-atoll-80185.herokuapp.com")
  end

  def self.post_user(user_id, zip, picture_url, username)
    response = connection.post("/api/v1/profiles") do |f|
      f.params['user_id'] = user_id
      f.params['zipcode'] = zip
      f.params['profile_picture'] = picture_url
      f.params['username'] = username
    end
    parse(response)
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
end