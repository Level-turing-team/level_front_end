require 'rails_helper'

RSpec.describe Circle, type: :model do
  describe 'circle poro' do
    it 'should create a circle poro with the correct methods' do
      time = Time.now

      data = {
                attributes:
                            {
                              profile_picture: 'www.google.com',
                              username: 'username'
                            }
              }

      @circle = Circle.new(data)

      expect(@circle.profile_picture).to eq('www.google.com')
      expect(@circle.username).to eq('username')
    end
  end
end
