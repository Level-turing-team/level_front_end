class Profile
  attr_reader :username,
              :id,
              :circle,
              :posts,
              :tags,
              :circle_posts,
              :profile_photo,
              :galleries

  def initialize(data)
    @id = data[:id]
    @username = data[:username]
    @circle = data[:circle]
    @posts = data[:posts]
    @tags = data[:tags]
    @circle_posts = data[:circle_posts]
    @galleries = data[:galleries]
    @profile_photo = data[:profile_photo]
  end
end
