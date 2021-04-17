class Profile
  attr_reader :username, :uid, :circle, :posts, :tags, :circle_posts
  def initialize(data)
    @uid = data[:uid]
    @circle = data[:circle]
    @posts = data[:posts]
    @tags = data[:tags]
    @circle_posts = data[:circle_posts]
  end
end