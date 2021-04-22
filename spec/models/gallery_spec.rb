require 'rails_helper'

RSpec.describe Gallery, type: :model do
  describe 'gallery poro' do
    it 'should create a gallery poro with the correct methods' do
      time = Time.now

      data = {
                id: '1',
                user_id: '1',
                name: 'gallery 1',
                created_at: time,
                updated_at: time,
                photos: ['photos']
              }

      @gallery = Gallery.new(data)

      expect(@gallery.id).to eq('1')
      expect(@gallery.user_id).to eq('1')
      expect(@gallery.name).to eq('gallery 1')
      expect(@gallery.created_at).to eq(time)
      expect(@gallery.updated_at).to eq(time)
      expect(@gallery.photos).to eq(['photos'])
    end
  end
end
