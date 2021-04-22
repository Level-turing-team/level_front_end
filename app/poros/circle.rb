class Circle
  attr_reader :profile_picture,
              :username,
              :id
  def initialize(data)
    @profile_picture = data[:attributes][:profile_picture]
    @username = data[:attributes][:username]
    @id = data[:id].to_i
  end
end
