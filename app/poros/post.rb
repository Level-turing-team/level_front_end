class Post
  attr_reader :id,
              :content,
              :link,
              :user_id 

  def initialize(data)
    @id = data[:id]
    @content = data[:attributes][:content]
    @link = data[:attributes][:link]
    @user_id = data[:attributes][:user_id]
  end
end