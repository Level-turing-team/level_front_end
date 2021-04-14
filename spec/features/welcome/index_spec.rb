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
  end

  # describe "they should see a Button to Log in" do
  #   it "And they can login with a correct username and password" do
  #     user = User.create!(first_name: "Bob", last_name: "Fake", username: "funbucket13", email: 'funbucket13@gmail.com')
  #     # within '.login-form' do
  #       fill_in :username, with: user.username
  #
  #       click_on "Log In"
  #     # end
  #
  #     expect(current_path).to eq(dashboard_path)
  #   end
  # end
end
