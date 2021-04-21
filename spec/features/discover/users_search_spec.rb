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
  describe ' sad path it searches by name, distance, or tag', :vcr do
    it 'has 0 results if no name found' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      page.choose('option1')
      fill_in 'search_term', with: 'aldkjs'
      click_button 'commit'

      expect(dashboard_index_path)
      within('.results') do
        expect(page).to_not have_content('slipknot')
        expect(page).to_not have_content('photos by jim')
        expect(page).to_not have_content('arteest')
        expect(page).to_not have_content('former salesman')
        expect(page).to_not have_content('korn')
        expect(page).to_not have_content('Pie')
        expect(page).to have_content('You have 0 results')
      end
    end
    it 'has 0 results if there are no users within distance given' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      page.choose('option2')
      fill_in 'search_term', with: '1'
      click_button 'commit'
      expect(dashboard_index_path)
      within('.results') do
        expect(page).to_not have_content('slipknot')
        expect(page).to_not have_content('photos by jim')
        expect(page).to_not have_content('arteest')
        expect(page).to_not have_content('former salesman')
        expect(page).to_not have_content('korn')
        expect(page).to_not have_content('Pie')
        expect(page).to have_content('You have 0 results')
      end
    end
    it 'has 0 results if there are no artists with the tag provided' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit discover_index_path(@user_1)

      page.choose('option3')
      fill_in 'search_term', with: 'Singer'
      click_button 'commit'
      expect(dashboard_index_path)
      within('.results') do
        expect(page).to_not have_content('slipknot')
        expect(page).to_not have_content('photos by jim')
        expect(page).to_not have_content('arteest')
        expect(page).to_not have_content('former salesman')
        expect(page).to_not have_content('korn')
        expect(page).to_not have_content('Pie')
        expect(page).to have_content('You have 0 results')
      end
    end
  end
end