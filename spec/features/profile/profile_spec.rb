require 'rails_helper'

RSpec.describe 'Profile Page' do
  before :each do
    @user_1 = User.first
    @user_2 = User.second
    @user_3 = User.third
    @user_4 = User.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  #happy path
  describe "profile route" do
    it "exists" do
      VCR.use_cassette("profile_route", 
        match_requests_on: %i[body]) do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '123' } }
        visit profile_path
        
        expect(current_path).to eq(profile_path)
        expect(page).not_to have_content("Action Needed!")
      end
    end
  end

  #sad path
  describe "profile route sad path" do
    it "doesnt let you log in" do
      VCR.use_cassette("doesnt_log_in", 
        match_requests_on: %i[body]) do
          visit root_path
          login
          visit profile_path
          expect(page).to have_content("Action Needed!")
          expect(page).to have_field 'user[username]'
          expect(page).to have_field 'user[zip]'
        end
      end
    end

    #sad path
    describe "dashboard route sad path" do
      it "doesnt let you log in", :vcr do
        visit root_path
        login
        expect(page).to have_content("Registration")
        expect(page).to have_field 'user[username]'
        expect(page).to have_field 'user[zip]'
        expect(page).to have_field 'user[profile_gallery_picture]'
      end
    end

    describe "artist bio" do
      it "should have a section for artist bio" do
        VCR.use_cassette("artist_bio_profile_page", 
          match_requests_on: %i[body]) do
            allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '123' } }
            visit profile_path

            within("#artist-bio") do
              expect(page).to have_content("music is dope")
              expect(page).to have_content("Created by #{@user_1.username}")
            end
        end
    end
  end

  describe "artist bio" do
    it "should have a section for artist bio even when not given" do
      VCR.use_cassette("see_section_when_bio_not_given", 
      match_requests_on: %i[body]) do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_4)
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '101' } }

        visit profile_path
        within("#artist-bio") do
          expect(page).to have_content("Nothing to see here!")
        end
      end
    end
  end

  describe "profile route" do
    it "shows other profiles" do
      VCR.use_cassette("profile_can_see_another_user", 
      match_requests_on: %i[body]) do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '123' } }
        visit "/profile"

        expect(page).not_to have_content "#{@user_2.username}"
        expect(page).to have_content "#{@user_1.username}'s profile"

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '456' } }
        visit "/profile"

        expect(page).to have_content "#{@user_2.username}"
        expect(page).not_to have_content "#{@user_1.username}"
      end
    end
  end
  
  describe "profile page" do
    it "shows distance to other profiles" do
      VCR.use_cassette("shows_distance_to_other_profiles", 
        match_requests_on: %i[body]) do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '101' } }
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_4)

        visit "/profile"

        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '456' } }
        visit "/profile"

        within ("#distance") do
          expect(page).to have_content("20.82 miles from you")
        end
      end
    end

    it "displays the users profile pic and name" do 
      VCR.use_cassette("displays_profile_pic_and_name", 
      match_requests_on: %i[body]) do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '123' } }
        visit profile_path

        expect(current_path).to eq(profile_path)
        
        page.find('#profilepicture')[:src]
        expect(page.status_code).to eq(200)
          
        
        within ("#username") do 
          expect(page).to have_content(@user_1.username)
        end
      end
    end

    it "displays the posts on current_user page and friends page" do 
      VCR.use_cassette("see_posts_spec", 
      match_requests_on: %i[body]) do
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '123' } }
        visit profile_path
        
        expect(current_path).to eq(profile_path)
        within('#posts') do
          expect(page).to have_content('hey did you see that lil nas X video?')
          expect(page).to have_content('hey did you see that create meme?')
          expect(page).to have_content('hey did you see that riot footage?')
          expect(page).to have_link('photoURL.com')
        end
        
        allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '910' } }
        visit "/profile"
        
        within('#posts') do
          expect(page).to have_content('hey did you see that lil nas X video?')
          expect(page).to have_content('hey did you see that create meme?')
          expect(page).to have_content('hey did you see that riot footage?')
          expect(page).to have_link('photoURL.com')
        end
      end
    end

    it "displays the featured photo of every gallery a user has" do 
      VCR.use_cassette("see_featured_gallery_photo",
        match_requests_on: %i[body]) do
          allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '123' } }
          visit profile_path

          page.find(".image-1")[:src]
          page.status_code.should be 200

          page.find(".image-2")[:src]
          page.status_code.should be 200

          page.find(".image-3")[:src]
          page.status_code.should be 200

          click_button "Profile"
            
          expect(current_path).to eq(galleries_path)
      end
    end
  end
end
