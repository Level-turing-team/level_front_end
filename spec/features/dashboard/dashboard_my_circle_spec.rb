require 'rails_helper'

RSpec.describe 'User Dashboard' do
  before :each do
    db_dump
    # @user_1 = User.create!(first_name: "Test", last_name: "Account", email: "something@example.com",username: "test-user", google_id: "123", zip: "12345",bio:"music is dope")
    # @user_2 = User.create!(first_name: "Other", last_name: "Account", email: "somethingelse@example.com",username: "test-user-2", google_id: "456", zip: "23456",bio:"i love music")
    # @sad_user = User.create!(first_name: "Other", last_name: "Account", email: "saduser@example.com", google_id: "456")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  #happy path
  describe "When I go to the dashboard i see a section for my circle" do
    it "has a profile name and photo for ever user in my circle", :vcr do
      visit dashboard_index_path(@user)
      expect(current_path).to eq(dashboard_index_path(@user))
      within('#topcornerleft') do
        expect(page).to have_content("My Circle")
        expect(page).to have_content(@user_3.username)
        expect(page).to have_content(@user_4.username)
        expect(page).to have_content(@user_5.username)
        expect(page).to have_content(@user_6.username)
      end
    end
  end
  #sad path
    it "has no friends displayed if the user has no friends in the circle" do
      sad_user = User.create!(first_name: "Sad Test", last_name: "Account", email: "sad_something@example.com",username: "test-user-sad", google_id: "123", zip: "12345",bio:"music is dope")
      visit dashboard_index_path(sad_user)
      expect(current_path).to eq(dashboard_index_path(sad_user))
      within('#topcornerleft') do
        expect(page).to have_content("My Circle")
        expect(page).to_not have_content(@user_3.username)
        expect(page).to_not have_content(@user_4.username)
        expect(page).to_not have_content(@user_5.username)
        expect(page).to_not have_content(@user_6.username)
      end
    end
end