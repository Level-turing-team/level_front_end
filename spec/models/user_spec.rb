require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name}
  end

  describe 'Class Methods' do
    it '::from_omniauth' do
      user = OmniAuth::AuthHash.new({
              :provider => 'google_oauth2',
              :uid => '123545',
              :info => {
                    :first_name => 'Test',
                    :last_name => "Test",
                    :email => "test@test.com"
                  },
                  :credentials => {
                    :token => "token",
                    :secret => "secret"
                  }
                  })
      expect(User.from_omniauth(user)).to eq(User.first)
    end
  end
end
