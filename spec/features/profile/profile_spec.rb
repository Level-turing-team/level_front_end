require 'rails_helper'

RSpec.describe 'Profile Page' do
  before :each do
    @user_1 = User.first
    @user_2 = User.second
    @user_3 = User.third
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    # User.destroy_all
    # @user_1 = User.create!(first_name: "Test", last_name: "Account", email: "something@example.com",username: "test-user", google_id: "123", zip: "12345",bio:"music is dope")
    # @user_2 = User.create!(first_name: "Other", last_name: "Account", email: "somethingelse@example.com",username: "test-user-2", google_id: "456", zip: "23456",bio:"i love music")
    # @sad_user = User.create!(first_name: "Other", last_name: "Account", email: "saduser@example.com", google_id: "456")
  end
  #happy path
  describe "profile route" do
    it "exists" do
      VCR.use_cassette("profile_route", 
        match_requests_on: %i[body]) do
        visit root_path
        login

        fill_in 'user[username]', with: "name"
        fill_in 'user[zip]', with: "8111"
        fill_in 'user[bio]', with: "bio testing"

        click_button 'Register'

        visit profile_path
        expect(current_path).to eq(profile_path)
        expect(page).not_to have_content("Action Needed!")
      end
    end
  end
  #sad path
  describe "profile route sad path" do
    it "doesnt let you log in", :vcr do
      visit root_path
      login
      visit profile_path
      expect(page).to have_content("Action Needed!")
      expect(page).to have_field 'user[username]'
      expect(page).to have_field 'user[zip]'
    end
  end
  #sad path
  describe "dashboard route sad path" do
    it "doesnt let you log in", :vcr do
      visit root_path
      login
      expect(page).to have_content("Your page needs a new name")
      expect(page).to have_field 'user[username]'
      expect(page).to have_field 'user[zip]'
    end
  end
  describe "artist bio" do
    it "should have a section for artist bio" do
      VCR.use_cassette("artist_bio_profile_page", 
      match_requests_on: %i[body]) do
        visit root_path
        login

        fill_in 'user[username]', with: "name"
        fill_in 'user[zip]', with: "8111"
        fill_in 'user[bio]', with: "bio testing"

        click_button 'Register'

        visit profile_path
        within("#artist-bio") do
          expect(page).to have_content("bio testing")
        end
      end
    end
  end

  describe "artist bio" do
    it "should have a section for artist bio even when not given", :vcr do
      visit root_path
      login

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"

      click_button 'Register'

      logged_in_user = User.find_by(email: "test@test.com")
      visit profile_path
      within("#artist-bio") do
        expect(page).to have_content("Nothing to see here!")
      end
    end
  end

  describe "profile route" do
    it "shows other profiles", :vcr do
      visit root_path
      login

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "bio testing"



      click_button 'Register'

      logged_in_user = User.find_by(email: "test@test.com")
      visit "/profile"
      expect(page).not_to have_content "#{@user_1.username}"
      expect(page).to have_content "#{logged_in_user.username}"

      click_on "other profile"

      expect(page).to have_content "#{@user_1.username}"
      expect(page).not_to have_content "#{logged_in_user.username}"
    end
  end
  describe "profile page" do
    xit "shows distance to other profiles", :vcr do
      visit root_path
      login

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "bio testing"



      click_button 'Register'

      logged_in_user = User.find_by(email: "test@test.com")
      visit "/profile"
      within ("#distance") do
        expect(page).to have_content("You are 0 miles from yourself")
      end


      click_on "other profile"


      within ("#distance") do
        expect(page).to have_content("11.51 miles from you")
      end
    end
    xit "displays the users profile pic and name", :vcr do 
      visit root_path
      login
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "bio testing"
      attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
      click_button 'Register'
      logged_in_user = User.find_by(email: "test@test.com")
      visit profile_path
      expect(current_path).to eq(profile_path)
      within ("#profilePicture") do 
        # check for display once image actually displays
      end
      within ("#username") do 
        expect(page).to have_content(logged_in_user.username)
      end
    end
    xit "displays the posts of the user profile you are viewing", :vcr do 
      visit root_path
      login
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "bio testing"
      attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
      click_button 'Register'
      logged_in_user = User.find_by(email: "test@test.com")
      logged_in_user.update(id: "3")
      visit profile_path
      expect(current_path).to eq(profile_path)
    end
    xit "displays the users profile pic and name", :vcr do 
      visit root_path
      login
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "bio testing"
      attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
      click_button 'Register'
      logged_in_user = User.find_by(email: "test@test.com")
      visit profile_path
      expect(current_path).to eq(profile_path)
      within ("#profilePicture") do 
        # check for display once image actually displays
      end
      within ("#username") do 
        expect(page).to have_content(logged_in_user.username)
      end
    end
    xit "displays the posts of the user profile you are viewing", :vcr do 
      visit root_path
      login
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "bio testing"
      attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
      click_button 'Register'
      logged_in_user = User.find_by(email: "test@test.com")
      logged_in_user.update(id: "3")
      visit profile_path
      expect(current_path).to eq(profile_path)
    end
  end
end
