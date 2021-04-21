require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit root_path
  end

  describe "When a user visits the root path" do
    it "they should be on the welcome page", :vcr do
      expect(current_path).to eq("/")
    end

    it "they should see a welcome message", :vcr do
      expect(page).to have_content("LEVEL")
    end

    it "they should see a button to log in with google", :vcr do

        expect(page).to have_button('Log in/Register with Google')
        login
        expect(current_path).to eq(register_path)

        fill_in 'user[username]', with: "name"
        fill_in 'user[zip]', with: "8111"
        attach_file("user[profile_gallery_picture]", Rails.root + "spec/fixtures/fluff.jpg")

        click_button 'Register'
        expect(current_path).to eq(dashboard_index_path)

    end
  end

  describe 'It logs out/log  in', :vcr do
    it 'happy path' do
        expect(page).to have_button('Log in/Register with Google')
        login
        expect(current_path).to eq(register_path)

        fill_in 'user[username]', with: "name"
        fill_in 'user[zip]', with: "8111"
        attach_file("user[profile_gallery_picture]", Rails.root + "spec/fixtures/fluff.jpg")

        click_button 'Register'
        expect(current_path).to eq(dashboard_index_path)

        click_link 'Log Out'
        expect(current_path).to eq(root_path)
    end
  end
end
