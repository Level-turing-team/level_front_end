require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit root_path
  end

  describe "When a user visits the root path" do
    it "they should be on the welcome page", :vcr do
      expect(current_path).to eq("/")
    end

    it "they should see a button to log in with google" do
      VCR.use_cassette("google button#{Time.now}") do
        expect(page).to have_button('Log in/Register with Google')
        login
        expect(current_path).to eq(register_path)

        fill_in 'user[username]', with: "name"
        fill_in 'user[zip]', with: "8111"
        fill_in 'user[bio]', with: 'Im painter'
        fill_in 'user[photo_description]', with: 'this painter'
        attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")

        click_button 'Register'
        expect(current_path).to eq(dashboard_index_path)
      end
    end
  end

  describe 'It logs out/log  in' do
    it 'happy path' do
      VCR.use_cassette("log_in/out #{Time.now}") do
        expect(page).to have_button('Log in/Register with Google')
        login
        expect(current_path).to eq(register_path)

        fill_in 'user[username]', with: "name"
        fill_in 'user[zip]', with: "8111"
        fill_in 'user[bio]', with: 'Im painter'
        fill_in 'user[photo_description]', with: 'this painter'
        attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")

        click_button 'Register'
        expect(current_path).to eq(dashboard_index_path)

        click_link 'Log Out'
        expect(current_path).to eq(root_path)
      end
    end
  end
end
