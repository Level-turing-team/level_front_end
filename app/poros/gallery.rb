class Gallery
  attr_reader :id,
              :user_id,
              :name,
              :photo_url,
              :created_at,
              :updated_at

  def initialize(data)
    @id = data[:id]
    @user_id = data[:user_id]
    @name = data[:name]
    @photo_url = data[:photo_url]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @photos = data[:photos]
  end
end
