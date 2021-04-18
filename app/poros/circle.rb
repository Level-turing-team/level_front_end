class Circle 
  attr_reader :zipcode,
              :user_id,
              :profile_picture,
              :username

  def initialize(data)
    @zipcode = data[:attributes][:zipcode]
    @user_id = data[:attributes][:user_id]
    @profile_picture = data[:attributes][:profile_picture]
    @username = data[:attributes][:username]
  end
end