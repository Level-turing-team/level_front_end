require 'rails_helper'

RSpec.describe 'As an authenticated user' do
  before :each do
    @user = User.create(
      email: 'example@example.com',
      id: '7',
      google_id: '12345',
      zip: '80022',
      first_name: 'john',
      last_name: 'whatever',
      username: 'Pie'
    )
    @user2 = User.create(
      email: 'test@example.com',
      id: '10000004',
      google_id: '34232',
      zip: '80024',
      first_name: 'null',
      last_name: 'also null',
      username: 'secondPie'
    )
  end
  scenario 'when I visit my gallery page', :vcr do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit galleries_path
    expect(page).to have_content("My Galleries")

    within('.my-gallery') do
      expect(page).to have_content("#{@user.username} Galleries")
    end

    expect(page).to have_button("Upload Photos")

    click_on 'Upload Photos'
    expect(page).to have_field(:name)

    within(".profile") do
      fill_in :name, with: 'test gallery'
      fill_in :new_description, with: 'test photo'
      attach_file("images", Rails.root + "spec/fixtures/fluff.jpg")
      click_on 'Create Gallery'
    end
    
    expect(current_path).to eq(galleries_path)
  end
  scenario 'my gallery page shows gallery links', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit galleries_path(@user)
    expect(page).to have_button("Profile")
    page.find('.image-1')[:src]
    page.status_code.should be 200
  end

  scenario ' I click on gallery name to to display photos in the gallery', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit galleries_path(@user)
    expect(page).to have_button("Profile")
    click_on 'Profile'
    page.find('.photo-1')[:src]
    page.status_code.should be 200
  end

  scenario 'I can add photo to my gallery', :vcr do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit galleries_path

    expect(page).to have_button("Upload Photos")

    click_on 'Upload Photos'
    expect(page).to have_field(:description)
    within("#photo-upload") do
      find(:css, "#galleries_16").set(true)
      fill_in :description, with: 'test photo'
      attach_file("images", Rails.root + "spec/fixtures/fluff.jpg")
      click_on 'Upload'
    end
  end
end
