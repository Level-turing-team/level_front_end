require 'rails_helper'

RSpec.describe Tag, type: :model do 
  describe "Tag poro" do 
    it "creates a Tag poro from backend serialized data" do 
      data = {
              attributes: {
              name: "Drummer"
              }}
      
      response = Tag.new(data)

      expect(response.tag).to eq("Drummer")
      
    end
  end
end