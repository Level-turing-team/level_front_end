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
      login
      # expect(page).to have_button('Log in with Google')
    end
  end
end
