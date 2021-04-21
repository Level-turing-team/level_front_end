class BackendService
    def self.connection
    conn = Faraday.new(url: ENV['API_URL'])
  end

  def self.local_connection_photo
    conn = Faraday.new(url: ENV['API_URL']) do |f|
      f.request :multipart
      f.request :url_encoded
      f.adapter Faraday.default_adapter
    end
  end

  def self.post_gallery_photo(user_id, gallery_id, description, picture_url)
    file = Faraday::UploadIO.new(
      picture_url.tempfile.path,
      picture_url.content_type,
      picture_url.original_filename)
    payload = { :file => file }
    response = local_connection_photo.post("/api/v1/profiles/#{user_id}/galleries/#{gallery_id}/photos", payload) do |f|
      f.params['user_id'] = user_id
      f.params['gallery_id'] = gallery_id
      f.params['description'] = description
    end
  end

  def self.post_user_galleries(user_id, name, picture_url, photo_description)
    file = Faraday::UploadIO.new(
      picture_url.tempfile.path,
      picture_url.content_type,
      picture_url.original_filename)
    payload = { :file => file }
    response = local_connection_photo.post("/api/v1/profiles/#{user_id}/galleries", payload) do |f|
      f.params['user_id'] = user_id
      f.params['name'] = name
      f.params['photo_description'] = photo_description
    end
  end

  def self.get_user_galleries(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/galleries")
    parse(response)
  end

  def self.create_user_post(user_id, content, link)
    response = connection.post("/api/v1/profiles/#{user_id}/post") do |f|
      f.params['content'] = content
      f.params['link'] = link
      f.params['user_id'] = user_id
    end
    parse(response)
  end

  def self.post_user(user_id, zip)
    response = connection.post("/api/v1/profiles") do |f|
      f.params['user_id'] = user_id
      f.params['zipcode'] = zip
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

  def self.get_distance(current_user_id, requested_user_id)
    response = connection.get("/api/v1/distance?current_user=#{current_user_id}&user=#{requested_user_id}")
    parse(response)
  end

  def self.get_artists_near_me(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}/discover")
    parse(response)
  end

  def self.get_user(user_id)
    response = connection.get("/api/v1/profiles/#{user_id}")
    parse(response)
  end

  def self.get_gallery_photos(user_id, gallery_id)
    response = connection.get("/api/v1/profiles/#{user_id}/galleries/#{gallery_id}/photos")
    parse(response)
  end

  def self.get_all_photos
    response = connection.get("/api/v1/photos")
    parse(response)
  end

  def self.profile_search(user_id, search_term, search_type)
    response = connection.get("/api/v1/profiles/#{user_id}/search") do |f|
      f.params[search_type] = search_term
    end
    parse(response)
  end

  def self.post_tag(name)
    response = connection.post("/api/v1/tags") do |f|
      f.params['name'] = name
    end
    parse(response)
  end

  def self.post_profile_tag(user_id, tag_id)
    response = connection.post("/api/v1/profile/#{user_id}/tags") do |f|
      f.params['tag_id'] = tag_id
    end
    parse(response)
  end

  def self.create_user_circle(user_id, following_id)
    response = connection.post("/api/v1/profiles/#{user_id}/circle") do |f|
      f.params['following_id'] = following_id
      f.params['user_id'] = user_id
    end
    parse(response)
  end

  def self.delete_user_circle(user_id, following_id)
    response = connection.delete("/api/v1/profiles/#{user_id}/circle") do |f|
      f.params['following_id'] = following_id
      f.params['user_id'] = user_id
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
