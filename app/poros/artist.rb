class Artist
  attr_reader :zipcode,
              :username,
              :profile_picture 

  def initialize(data)
    @zipcode = data[:zipcode]
    @profile_picture = data[:profile_picture]
    @username = data[:username]
  end

  def self.combine(artist)
    user = User.find(artist[:attributes][:user_id])
    
    Artist.new({ 
      username: user.username,
      zipcode: user.zip,
      profile_picture: artist[:attributes][:profile_picture],
      #will need to add tag, and gallery photos
    })
  end
end