require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  before :each do
    test_db_dump
  end

  describe 'it searches by name, distance, or tag', :vcr do
    it 'searches by name' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      page.choose('option1')
      fill_in 'search_term', with: 'korn'
      click_button 'commit'

      expect(dashboard_index_path)
      within('.results') do
        expect(page).to have_content('korn')
        expect(page).to_not have_content('slipknot')
      end
    end
    it 'searches by distance' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      page.choose('option2')
      fill_in 'search_term', with: '50'
      click_button 'commit'
      expect(dashboard_index_path)
      within('.results') do
        expect(page).to have_content('slipknot')
        expect(page).to have_content('photos by jim')
        expect(page).to have_content('arteest')
        expect(page).to have_content('former salesman')
        expect(page).to have_content('korn')
        expect(page).to have_content('Pie')
      end
    end
    it 'searches by tag' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      page.choose('option3')
      fill_in 'search_term', with: 'Painter'
      click_button 'commit'
      expect(dashboard_index_path)
      within('.results') do
        expect(page).to have_content('slipknot')
        expect(page).to have_content('photos by jim')
        expect(page).to have_content('former salesman')
        expect(page).to_not have_content('korn')
      end
    end
  end
end
