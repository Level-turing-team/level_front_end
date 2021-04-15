require 'rails_helper'

RSpec.describe 'Profile Page' do
  before :each do
    visit root_path
    login
  end
  #happy path
  describe "profile route" do
    it "exists" do
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      click_button 'Register'
      expect(current_path).to eq(dashboard_index_path)
      visit "/profile"
      expect(current_path).to eq(profile_path)
      expect(page).not_to have_content("Action Needed!")
    end
  end
  #sad path
  describe "profile route sad path" do
    it "exists" do
      visit "/profile"
       expect(page).to have_content("Action Needed!")
       expect(page).to have_field 'user[username]'
       expect(page).to have_field 'user[zip]'
    end
  end
  #sad path
  describe "dashboard route sad path" do
    it "exists" do
       expect(page).to have_content("Your page needs a new name")
       expect(page).to have_field 'user[username]'
       expect(page).to have_field 'user[zip]'
    end
  end
  describe "artist bio" do
    it "should have a section for artist bio" do
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "music is life"
      click_button 'Register'
      visit "/profile"
      within("#artist-bio") do
        expect(page).to have_content("music is life")
      end
    end
  end

  describe "artist bio" do
    it "should have a section for artist bio even when not given" do
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      click_button 'Register'
      visit "/profile"
      within("#artist-bio") do
        expect(page).to have_content("Nothing to see here!")
      end
    end
  end
end
