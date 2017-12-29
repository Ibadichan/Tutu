require 'acceptance/acceptance_helper'

feature 'User can see railway station', '
  In order to see more information
  As an authenticated user
  I want to see railway station
' do

  given(:user) { create(:user) }
  given!(:railway_station) { create(:railway_station) }

  scenario 'User tries to see station' do
    sign_in user

    click_on 'Railway Stations'
    click_on 'See more ...'

    expect(current_path).to eq railway_station_path(railway_station)
    expect(page).to have_content railway_station.title
  end
end
