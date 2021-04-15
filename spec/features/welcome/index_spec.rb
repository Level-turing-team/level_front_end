require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit root_path
  end

  describe "When a user visits the root path" do
    it "they should be on the welcome page" do
      expect(current_path).to eq("/")
    end

    it "they should see a welcome message" do
      expect(page).to have_content("LEVEL")
    end

    it "they should see a button to log in with google" do
      expect(page).to have_button('Log in/Register with Google')
      login
      expect(current_path).to eq(register_path)

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"

      click_button 'Register'
      expect(current_path).to eq(dashboard_index_path)
      binding.pry
    end
  end
end
