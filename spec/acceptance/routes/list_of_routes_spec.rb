require 'acceptance/acceptance_helper'

feature 'User can see routes', '
  In order to manage routes
  As an authenticated user
  I want to see routes
' do

  given(:user) { create(:user) }
  given!(:routes) { create_list(:route, 2) }

  scenario 'User tries to see list of routes' do
    sign_in user

    click_on 'Routes'

    routes.each { |route| expect(page).to have_content route.title }
  end

  scenario 'Guest tries to see list of routes' do
    visit routes_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
