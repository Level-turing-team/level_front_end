class Photo
  attr_reader :description,
              :url,
              :created_at,
              :updated_at,
              :gallery_id

  def initialize(data)
    @description = data[:attributes][:description]
    @url = data[:attributes][:url]
    @created_at = data[:attributes][:created_at]
    @updated_at = data[:attributes][:updated_at]
    @gallery_id = data[:attributes][:gallery_id]
  end
end
