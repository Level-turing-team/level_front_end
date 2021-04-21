require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Tag poro" do
    it "creates a tag poro with the right data" do
      data = {
              attributes: {
                          name: "painter"
                          }
              }

      @tag = Tag.new(data)

      expect(@tag.name).to eq("painter")
    end
  end
end
