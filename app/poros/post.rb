class Post
  attr_reader :user, :content, :link, :created_at
  def initialize(data)
    @user = find_user_by_id(data[:attributes][:user_id])[0]
    @content = data[:attributes][:content]
    @created_at = data[:attributes][:created_at]
    @link = data[:attributes][:link]
  end

  def find_user_by_id(user_id)
    User.where(id: user_id)
  end
end
