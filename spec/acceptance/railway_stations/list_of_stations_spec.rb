require 'acceptance/acceptance_helper'

feature 'User can see list of stations', '
 In order to manage railway stations
 As an authenticated user
 I want to be able see list
' do

  given(:user) { create(:user) }
  given!(:railway_stations) { create_list(:railway_station, 2) }

  scenario 'Guest tries to see stations' do
    visit railway_stations_path

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'User tries to see stations' do
    sign_in user

    click_on 'Railway Stations'

    railway_stations.each { |station| expect(page).to have_content station.title }
  end
end
