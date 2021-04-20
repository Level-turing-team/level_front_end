class Gallery
  attr_reader :id,
              :user_id,
              :name,
              :created_at,
              :updated_at,
              :photos

  def initialize(data)
    @id = data[:id]
    @user_id = data[:user_id]
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @photos = data[:photos]
  end
end
