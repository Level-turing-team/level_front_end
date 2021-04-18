require 'rails_helper'
RSpec.describe 'User Dashboard' do
  before :each do
    db_dump
  end
  #happy path
  describe "When I go to the dashboard i see a section for my feed" do
    it "Other user's posts that I follow should appear here, ordered by most recently created", :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1.id)
      expect(current_path).to eq(dashboard_index_path(@user_1.id))
      within("#d-flex justify-content-center") do
        expect(page).to have_content("My Feed")
        expect(page).to have_content(@user_2.username)
        expect(page).to have_content("hey did you see that headline?")
        expect(page).to have_content("hey checkout my create shoes?")
        expect(page).to have_content("photoURL.com")

        expect(page).to have_content(@user_3.username)
        expect(page).to have_content("hey did you see software update?")
        expect(page).to have_content("hey did you see your mom called?")
        expect(page).to have_content(@user_4.username)
        expect(page).to have_content("hey did you see that we're not friends on FB anymore?")
        expect(page).to have_content("hey did you see hear about that create app called 'level'?")
        expect(page).to have_css(".user-pic")
        expect(page).to have_link("#{@user_3.username}")
        expect(page).to have_link("#{@user_4.username}")
      end
    end
  end
  #sad path
    xit "has no posts displayed if the user has no friends in the circle" do
      sad_user = User.create!(first_name: "Sad Test", last_name: "Account", email: "sad_something@example.com",username: "test-user-sad", google_id: "123", zip: "12345",bio:"music is dope")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sad_user)
      visit dashboard_index_path(sad_user.id)
      expect(current_path).to eq(dashboard_index_path(sad_user.id))
      within("#d-flex justify-content-center") do
        expect(page).to have_content("My Feed")
        expect(page).to_not have_content(@user_3.username)
        expect(page).to_not have_content(@user_4.username)
        expect(page).to_not have_content(@user_5.username)
        expect(page).to_not have_content(@user_6.username)
      end
    end
end
