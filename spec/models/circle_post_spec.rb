require 'rails_helper'

RSpec.describe CirclePost, type: :model do 
  describe "CirclePost poro" do 
    it "creates a CirclePost poro from backend serialized data" do 
      data = {
              attributes: {
              content: "Looking for a new Drummer, check out our music in the link",
              link: "www.soundcloud.com",
              user_id: "10000001"
              }}
      
      response = CirclePost.new(data)

      expect(response.content).to eq("Looking for a new Drummer, check out our music in the link")
      expect(response.link).to eq("www.soundcloud.com")
      expect(response.user_id).to eq("10000001")
    end
  end
end