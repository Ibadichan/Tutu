require 'acceptance/acceptance_helper'

feature 'User can see route', '
  In order to see more information
  As an authenticated user
  I want to see route
' do

  given(:user) { create(:user) }
  given!(:route) { create(:route) }

  scenario 'User tries to see route' do
    sign_in user

    click_on 'Routes'
    click_on 'See more ...'

    expect(current_path).to eq route_path(route)
    expect(page).to have_content route.title
  end
end
