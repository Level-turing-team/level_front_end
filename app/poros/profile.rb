class Profile
  attr_reader :username, :uid, :circle, :posts, :tags, :circle_posts
  def initialize(data)
    @uid = data[:uid]
    @circle = format_circle(data[:circle])
    @posts = format_posts(data[:posts])
    @tags = format_tags(data[:tags])
    @circle_posts = format_circle_posts(data[:circle_posts])
  end

  def format_posts(post_data)
    post_data.map do |post| 
      Post.new(post)
    end
  end

  def format_circle(circle_data)
    circle_data.map do |circle| 
      Circle.new(circle)
    end
  end

  def format_tags(tag_data)
    tag_data.map do |tag|
      Tag.new(tag)
    end
  end

  def format_circle_posts(circle_posts_data)
    circle_posts_data.map do |circle_post|
      CirclePost.new(circle_post)
    end
  end
  
end