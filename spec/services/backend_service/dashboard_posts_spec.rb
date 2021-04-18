# require 'rails_helper'
#
# RSpec.describe "Dashboards My Circle posts", type: :feature do
#   before :each do
#     visit root_path
#     login
#
#     fill_in 'user[username]', with: "name"
#     fill_in 'user[zip]', with: "8111"
#   end
#   describe "Get ‘profiles/:id/circle/posts’, to ‘users#circle_posts’	" do
#     describe "happy path" do
#       it "retuns 200 with all circle members recent posts, data including content, link, user_id" do
#         @json_details = File.read('spec/fixtures/logged_in_circles_posts.json')
#         json = stub_request(:get, "https://lit-atoll-80185.herokuapp.com/").to_return(status: 200, body: @json_details ).response
#
#         click_button 'Register'
#
#         response = JSON.parse(@json_details, symbolize_names: true)
#         # binding.pry
#
#         expect(response).to be_a(Hash)
#         expect(response[:dashboard_user_id]).to eq("14")
#         expect(response[:circle_members_posts]).to be_an(Array)
#         expect(response[:circle_members_posts].count).to eq(6)
#         expect(response[:circle_members_posts].first).to be_a(Hash)
#         expect(response[:circle_members_posts].first[:posts]).to be_a(String)
#         expect(response[:circle_members_posts].first.keys.count).to eq(3)
#
#       end
#       it "retuns 200 with empty body if you arent following anyone" do
#         @json_details = File.read('spec/fixtures/logged_in_circles_posts_empty.json')
#         json = stub_request(:get, "https://lit-atoll-80185.herokuapp.com/").to_return(status: 200, body: @json_details ).response
#
#         click_button 'Register'
#
#         response = JSON.parse(@json_details, symbolize_names: true)
#
#         expect(response).to be_a(Hash)
#         expect(response[:dashboard_user_id]).to eq("14")
#         expect(response[:circle_members_posts]).to be_an(Array)
#         expect(response[:circle_members_posts].count).to eq(0)
#       end
#     end
#   end
# end
