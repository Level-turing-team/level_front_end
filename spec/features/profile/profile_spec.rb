require 'rails_helper'

RSpec.describe 'Profile Page' do
  before :each do
    @user_1 = User.create!(first_name: "Test", last_name: "Account", email: "something@example.com",username: "test-user", google_id: "123", zip: "12345",bio:"music is dope")
    @user_2 = User.create!(first_name: "Other", last_name: "Account", email: "somethingelse@example.com",username: "test-user-2", google_id: "456", zip: "23456",bio:"i love music")
    @sad_user = User.create!(first_name: "Other", last_name: "Account", email: "saduser@example.com", google_id: "456")
  end
  #happy path
  describe "profile route" do
    it "exists" do
      visit root_path
      login

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "let me test this shit"

      click_button 'Register'

      logged_in_user = User.find_by(email: "test@test.com")
      visit profile_path
      expect(current_path).to eq(profile_path)
      expect(page).not_to have_content("Action Needed!")
    end
  end
  #sad path
  describe "profile route sad path" do
    it "exists" do
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
    it "exists" do
      visit root_path
      login
      expect(page).to have_content("Your page needs a new name")
      expect(page).to have_field 'user[username]'
      expect(page).to have_field 'user[zip]'
    end
  end
  describe "artist bio" do
    it "should have a section for artist bio" do
      visit root_path
      login

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "let me test this shit"

      click_button 'Register'

      logged_in_user = User.find_by(email: "test@test.com")
      visit profile_path
      within("#artist-bio") do
        expect(page).to have_content("let me test this shit")
      end
    end
  end

  describe "artist bio" do
    it "should have a section for artist bio even when not given" do
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
    it "shows other profiles" do
      visit root_path
      login

      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "let me test this shit"



      click_button 'Register'

      logged_in_user = User.find_by(email: "test@test.com")
      visit "/profile"
      expect(page).not_to have_content "#{@user_2.username}"
      expect(page).to have_content "#{logged_in_user.username}"

      click_on "other shit"

      expect(page).to have_content "#{User.first.username}"
      expect(page).not_to have_content "#{logged_in_user.username}"
    end
  end
end
