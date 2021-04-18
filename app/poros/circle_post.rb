class CirclePost 
  attr_reader :content,
              :link,
              :user_id 

  def initialize(data)
    @content = data[:attributes][:content]
    @link = data[:attributes][:link]
    @user_id = data[:attributes][:user_id]
  end
end