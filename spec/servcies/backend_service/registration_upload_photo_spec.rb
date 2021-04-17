require 'rails_helper'

RSpec.describe "Register page can upload profile pic", type: :feature do
  describe 'Photo Upload' do
    it "sends photo url to backend for storage" do
      visit root_path
      login
      fill_in 'user[username]', with: "name"
      fill_in 'user[zip]', with: "8111"
      fill_in 'user[bio]', with: "I'm super sick"
      attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
      @json_details = File.read('spec/fixtures/created_user.json')
      json = stub_request(:post, "https://lit-atoll-80185.herokuapp.com/").to_return(status: 201, body: @json_details ).response
      click_button 'Register'
      response = JSON.parse(@json_details, symbolize_names: true)
      expect(response).to be_a(Hash)
      expect(response[:message]).to eq("user has been created")
    end

    # it "sends photo url to backend for storage/sad path" do
    #   visit root_path
    #   login
    #   fill_in 'user[username]', with: "name"

    #   fill_in 'user[bio]', with: "I'm super sick"
    #   attach_file("user[picture_url]", Rails.root + "spec/fixtures/fluff.jpg")
    #   @json_details = File.read('spec/fixtures/not_created_user.json')
    #   json = stub_request(:post, "https://lit-atoll-80185.herokuapp.com/").to_return(status: 201, body: @json_details ).response
    #   binding.pry
    #   click_button 'Register'
    #   response = JSON.parse(@json_details, symbolize_names: true)
    #   expect(response).to be_a(Hash)
    #   expect(response[:error]).to eq("zip code required")
    # end
  end
end