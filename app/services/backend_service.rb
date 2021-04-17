class BackendService
  def self.get_data(endpoint)
    conn = Faraday.get("https://lit-atoll-80185.herokuapp.com/")
  end

  def self.post_profile_picture(url)
    Faraday.post("https://lit-atoll-80185.herokuapp.com/api/v1/photos")
  end

  def self.user_circle(user_id)
    response = get_data("profiles/#{user_id}/circle")
    parse(response)
  end

  def self.user_feed(user_id)
    response = get_data("profiles/#{user_id}/circle/posts")
    parse(response)
  end

  def self.dashboard_photos(user_id)
    response = get_data("profiles/#{user_id}/circle/photos")
    parse(response)
  end

private 
  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end