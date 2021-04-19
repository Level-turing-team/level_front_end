class Circle
  attr_reader :profile_picture,
              :username
  def initialize(data)
    @profile_picture = data[:attributes][:profile_picture]
    @username = data[:attributes][:username]
  end
end
