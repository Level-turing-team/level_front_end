# On my dashboard,
#
#  I see a section for my Feed.
#  Other user's posts that I follow should appear here, ordered by most recently created

require 'rails_helper'
RSpec.describe 'User Dashboard' do
  before :each do
    db_dump
  end
  #happy path
  describe "When I go to the dashboard i see a section for my feed" do
    it "Other user's posts that I follow should appear here, ordered by most recently created", :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit dashboard_index_path(@user)
      expect(current_path).to eq(dashboard_index_path(@user))
      within('.d-flex justify-content-center') do
        expect(page).to have_content("My Circle Feed")
        expect(page).to have_content(@user_3.username)
        expect(page).to have_content(@user_3.username)
        expect(page).to have_content(@user_4.username)
        expect(page).to have_content(@user_5.username)
        expect(page).to have_content(@user_6.username)
        expect(page).to have_css(".user-pic")
        expect(page).to have_link("#{@user_3.username}")
        expect(page).to have_link("#{@user_4.username}")
        expect(page).to have_link("#{@user_5.username}")
        expect(page).to have_link("#{@user_6.username}")
      end
    end
  end
  #sad path
    xit "has no friends displayed if the user has no friends in the circle" do
      sad_user = User.create!(first_name: "Sad Test", last_name: "Account", email: "sad_something@example.com",username: "test-user-sad", google_id: "123", zip: "12345",bio:"music is dope")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sad_user)
      visit dashboard_index_path(sad_user)
      expect(current_path).to eq(dashboard_index_path(sad_user))
      within('#topcornerleft') do
        expect(page).to have_content("My Circle")
        expect(page).to_not have_content(@user_3.username)
        expect(page).to_not have_content(@user_4.username)
        expect(page).to_not have_content(@user_5.username)
        expect(page).to_not have_content(@user_6.username)
        expect(page).to have_content("You have 0 Friends!")
      end
    end
end
