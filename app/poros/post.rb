class Post
  def initialize(data)
    @user = find_user_by_id(data[:attributes][:user_id])
    @content = data[:attributes][:content]
    @created_at = data[:attributes][:created_at]
    @link = data[:attributes][:link]
  end

  def find_user_by_id(user_id)
    User.where(id: user_id)
  end
end
