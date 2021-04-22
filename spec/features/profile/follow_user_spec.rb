require 'rails_helper'

RSpec.describe 'Follow another user from their profile' do 
  before :each do
    @user_1 = User.first
    @user_2 = User.second
    @user_3 = User.third
    @user_5 = User.find(5)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_5)
  end
  #happy path
  describe 'when on another users profile' do 
    it 'has a button to add them to your circle' do 
      VCR.use_cassette("button_to_add_user_to_your_circle", 
        match_requests_on: %i[body]) do
          allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: '456' } }
        
          visit "/profile"


          expect(page).to have_button("Add this user to your circle!")
          expect(page).to_not have_content("This user is in your circle!")
          click_button "Add this user to your circle!"

          expect(page).to_not have_button("Add this user to your circle!")
          expect(page).to have_content("This user is in your circle!")
          
          BackendService.delete_user_circle(@user_5.id, @user_2.id)
      end
    end
  end
end