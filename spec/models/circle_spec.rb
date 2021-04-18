require 'rails_helper'

RSpec.describe Circle, type: :model do 
  describe "Circle Poro" do 
    it "creates a Circle poro from backend serialized data" do 
      data = {
              attributes: {
              zipcode: "42",
              user_id: "52",
              username: "johnny bananas",
              profile_picture: "www.google.com"
              }}
      
      response = Circle.new(data)

      expect(response.zipcode).to eq("42")
      expect(response.user_id).to eq("52")
      expect(response.username).to eq("johnny bananas")
      expect(response.profile_picture).to eq("www.google.com")
    end
  end
end