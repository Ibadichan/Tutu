require 'acceptance/acceptance_helper'

feature 'User can edit station', '
  In order to change information
  As an authenticated user
  I want to update station
' do

  given(:user) { create(:user) }
  given!(:railway_station) { create(:railway_station) }

  describe 'User tries to update route' do
    background do
      sign_in user
      click_on 'Railway Stations'
      click_on 'Update'
    end

    scenario 'with valid attributes' do
      fill_in 'Title', with: 'new title'
      click_on 'Edit'

      expect(current_path).to eq railway_station_path(railway_station)
      expect(page).to have_content 'Railway station was successfully updated.'
      expect(page).to have_content 'new title'
    end

    scenario 'with invalid attributes' do
      fill_in 'Title', with: ''
      click_on 'Edit'

      expect(page).to have_content 'Railway station could not be updated.'
      expect(page).to have_content "title can't be blank"
    end
  end
end
