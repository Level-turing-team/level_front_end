require 'rails_helper'

RSpec.describe Post, type: :model do 
  describe "Post Poro" do 
    it "creates a Post poro from backend serialized data" do 
      data = {
              id: "42",
              attributes: {
              content: "this is fake content",
              link: "https://media.wired.com/photos/5cdefb92b86e041493d389df/1:1/w_988,h_988,c_limit/Culture-Grumpy-Cat-487386121.jpg",
              user_id: "123"
              }}
      
      response = Post.new(data)

      expect(response.id).to eq("42")
      expect(response.content).to eq("this is fake content")
      expect(response.link).to eq("https://media.wired.com/photos/5cdefb92b86e041493d389df/1:1/w_988,h_988,c_limit/Culture-Grumpy-Cat-487386121.jpg")
      expect(response.user_id).to eq("123")
    end
  end
end