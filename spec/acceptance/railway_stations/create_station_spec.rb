require 'acceptance/acceptance_helper'

feature 'User can create railway station', '
  In order to expand application
  As an authenticated user
  I want to create station
' do

  given(:user) { create(:user) }

  describe 'User tries to create railway station' do
    background do
      sign_in user
      click_on 'Railway Stations'
      click_on 'Add Railway Station'
    end

    scenario 'with valid attributes' do
      fill_in 'Title', with: 'my title'
      click_on 'Create'

      expect(current_path).to eq railway_station_path(RailwayStation.last)
      expect(page).to have_content RailwayStation.last.title
      expect(page).to have_content 'Railway station was successfully created.'
    end

    scenario 'with invalid attributes' do
      fill_in 'Title', with: ''
      click_on 'Create'

      expect(page).to have_content 'Railway station could not be created.'
      expect(page).to have_content "title can't be blank"
    end
  end
end
