require 'rails_helper'

RSpec.describe 'Register Page' do
  before :each do
    visit root_path
    login
  end

  describe 'Photo Upload' do
    it "sends photo url to backend for storage", :vcr do

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "I'm super sick"
      attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
      click_button 'Register'
      expect(current_path).to eq(dashboard_index_path)
      # expect(User.first.picture_url.class).to eq(String)
      # expect(User.first.picture_url).to an_instance_of(String)
    end
  end
end
