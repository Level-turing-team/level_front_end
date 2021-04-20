require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  before :each do
    test_db_dump
  end

  describe 'it searches by name, distance, or tag', :vcr do
    it 'searches by name' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      fill_in 'Search', with: 'korn'
      click_button 'Search'

      expect(dashboard_index_path)
      within('.search_card') do
        expect(page).to have_content('korn')
        expect(page).to_not have_content('slipknot')
      end
    end
  end
end