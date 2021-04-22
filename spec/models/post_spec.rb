require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'post poro' do
    it 'should create a post poro with the correct methods' do
      time = Time.now

      data = {
                attributes:
                            {
                              user_id: 1,
                              content: 'love google!',
                              created_at: time,
                              link: 'www.google.com'
                            }
              }

      @post = Post.new(data)

      expect(@post.content).to eq('love google!')
      expect(@post.created_at).to eq(time)
      expect(@post.link).to eq('www.google.com')
    end
  end
end
