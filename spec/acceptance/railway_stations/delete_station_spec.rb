require 'acceptance/acceptance_helper'

feature 'User can delete station', '
  In order to delete old information
  As an authenticated user
  I want to delete station
' do

  given(:user) { create(:user) }
  given!(:railway_station) { create(:railway_station) }

  scenario 'User tries to delete railway station', js: true do
    sign_in user

    click_on 'Railway Stations'
    click_on 'Destroy'

    expect(current_path).to eq railway_stations_path
    expect(page).to_not have_content railway_station.title
  end
end
