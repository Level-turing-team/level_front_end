require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  before :each do
    @user = User.create(
      email: 'example@example.com', 
      id: '10000002', 
      google_id: '12345',
      zip: '80022', 
      first_name: 'john',
      last_name: 'whatever',
    )
    @user2 = User.create(
      email: 'test@example.com',
      id: '10000004',
      google_id: '34232',
      zip: '80024',
      first_name: 'null',
      last_name: 'also null'
    )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  scenario 'I see no users if none are in a zipcode 10 miles from me' do
    visit discover_index_path
    
    within('.artists_near_me') do
      expect(page).to have_content("Artists Near Me: 1")
      expect(page).to have_content("Zipcode: 80024")
      expect(page).to have_content("Artist:")
      expect(page).to have_content("Profile Picture:")
    end
  #   {
  #     "data": [
  #         {
  #             "id": "19",
  #             "type": "profile",
  #             "attributes": {
  #                 "zipcode": "80024",
  #                 "user_id": 10000004,
  #                 "profile_picture": "http://www.google.com",
  #                 "username": null
  #             }
  #         }
  #     ]
  # }
  end
end