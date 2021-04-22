class DiscoverFacade < BackendFacade
  def self.profile_object(user_id)
    profile_photo = BackendService.get_user(user_id)[:data][:attributes][:profile_picture]
    username = BackendService.get_user(user_id)[:data][:attributes][:username]
    zipcode = BackendService.get_user(user_id)[:data][:attributes][:zipcode]
    Profile.new({
      id: user_id,
      username: username,
      profile_photo: profile_photo,
      zipcode: zipcode
    })
  end

  def self.recent_photo_objects
    BackendService.get_all_photos[:data].map do |data|
      Photo.new(data)
    end
  end

  def self.search_user_objects(user_id, search_term, search_type)
    BackendService.profile_search(user_id, search_term, search_type)[:data].map do |data|
      profile_object(data[:id])
    end
  end

  def self.artists_near_me(user_id)
    artists = BackendService.get_artists_near_me(user_id)
    artists[:data].flat_map do |data|
      info = {
          id: data[:attributes][:user_id],
          zipcode: data[:attributes][:zipcode],
          username: data[:attributes][:username],
          profile_photo: data[:attributes][:profile_picture]
        }
      Profile.new(info)
    end
  end
end
