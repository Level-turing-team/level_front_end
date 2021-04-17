class Profile
  attr_reader :username, :uid, :circle, :posts, :tags, :circle_posts
  def initialize(data)
    @uid = data[:uid]
    @circle = data[:circle]
    @posts = format_posts(data[:posts])
    @tags = data[:tags]
    @circle_posts = data[:circle_posts]
  end

  def format_posts(post_data)
    post_data.map do |post| 
      Post.new(post)
    end
  end
  
end