require 'rails_helper'
RSpec.describe 'As an authenticated user' do
  before :each do
    @user_1 = User.first
    # test_db_dump
  end
  describe 'Theres a section where i can see all users photos', :vcr do
    it 'shows all the users photos ' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)
      
      within('.recent_photos') do
        expect(page).to have_xpath("//*[@id='my-feed']/div/div/div[1]/a/img")
        expect(page).to have_xpath("//*[@id='my-feed']/div/div/div[2]/a/img")
        expect(page).to have_xpath("//*[@id='my-feed']/div/div/div[3]/a/img")
        expect(page).to have_xpath("//*[@id='my-feed']/div/div/div[4]/a/img")
      end
    end
  end
end