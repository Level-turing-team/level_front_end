class BackendService
  def self.get_data(endpoint)
    conn = Faraday.get("https://lit-atoll-80185.herokuapp.com/")
  end

  def self.user_circle(user_id)
    response = get_data("profiles/#{user_id}/circle")
    parse(response)
  end


  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end