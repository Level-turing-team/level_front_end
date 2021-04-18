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
    end

    it 'redirects to register/sad path' do
      expect(page).to have_button('Log in/Register with Google')
      login
      expect(current_path).to eq(register_path)

      click_button 'Register'
      expect(current_path).to eq(register_path)
    end
  end

  describe 'It logs out/log  in' do
    it 'happy path' do
      expect(page).to have_button('Log in/Register with Google')
      login
      expect(current_path).to eq(register_path)

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"

      click_button 'Register'
      expect(current_path).to eq(dashboard_index_path)

      # find("#navbarDropdown").find(:xpath, 'option[2]').select_option
      within ("#navbarDropdown") do 
        # click_button "#navbarDropdown"  
        click_link 'Log Out'
      end

      # click_button "#navbarDropdown"
      expect(current_path).to eq(root_path)

      login
      expect(current_path).to eq(dashboard_index_path)
    end
  end
end
