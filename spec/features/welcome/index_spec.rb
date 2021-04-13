require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do
    visit root_path
  end

  describe "When a user visits the root path" do
  it "they should be on the welcome page" do
    expect(current_path).to eq("/")
  end
end
