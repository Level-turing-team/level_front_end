require 'rails_helper'

RSpec.describe 'Dashboord Index', type: :feature do
  before :each do
    @user_1 = User.find(1)
    @user_2 = User.find(2)
    @user_3 = User.find(3)
    @user_4 = User.find(4)
    @user_5 = User.find(5)
  end

  describe 'happy path' do
    it 'should have a nav bar', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1)

      within '.navbar' do
        # need to go back and test these links work
        expect(page).to have_content('Leve⅃')
        expect(page).to have_link('Discover')
        expect(page).to have_link('My Galleries')
        expect(page).to have_link('My Profile')
      end
    end

    it 'when i go to my dashboard I should see my circle', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1)

      within '#my-circle' do
        expect(page).to have_content('My Circle')
        expect(page).to have_content('You have 4 friends')
        expect(page).to have_link(@user_2.username)
        expect(page).to have_link(@user_3.username)
        expect(page).to have_link(@user_4.username)
        expect(page).to have_link(@user_5.username)

        #need to go back and test this once the profile is set up

        # click_link "#{@user_2.username}"
        # expect(current_path).to eq(profile_path(@user_2))
      end
    end

    it 'should have username and profile photo', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1)

      expect(page).to have_content("#{@user_1.username}")
      expect(page).to have_css(".small-circular")
    end

    it 'should be able to create a post', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1)

      expect(page).to have_content('Create Post')
      fill_in :content, with: "this is my first post"
      fill_in :link, with: 'www.google.com'
      click_on 'Create Post'

      expect(current_path).to eq(dashboard_index_path(@user_1))

      # visit profile_path(@user_1)

      # expect(page).to have_content('this is my first post')
      # expect(page).to have_content('www.google.com')
    end

    it 'should have the users feed', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1)

      within '#my-feed' do
        expect(page).to have_content('hey did you see that headline?')
        expect(page).to have_content('hey checkout my create shoes?')
        expect(page).to have_content("hey did you see that we're not friends on FB anymore?")
      end
    end
  end

  describe 'sad path' do
    it 'creating a post with no link still works', :vcr do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      visit dashboard_index_path(@user_1)


      expect(page).to have_content('Create Post')
      fill_in :content, with: "this is my first post"
      click_on 'Create Post'

      expect(current_path).to eq(dashboard_index_path(@user_1))

      # visit profile_path(@user_1)

      # expect(page).to have_content('this is my first post')
    end
  end
end
