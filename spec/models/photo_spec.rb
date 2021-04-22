require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'photo poro' do
    it 'should create a photo poro with the correct methods' do
      time = Time.now

      data = {
                attributes:
                            {
                              description: 'description',
                              url: 'www.google.com',
                              created_at: time,
                              updated_at: time,
                              gallery_id: 5
                            }
              }

      @photo = Photo.new(data)

      expect(@photo.description).to eq('description')
      expect(@photo.url).to eq('www.google.com')
      expect(@photo.created_at).to eq(time)
      expect(@photo.updated_at).to eq(time)
    end
  end
end
