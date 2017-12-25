require 'acceptance/acceptance_helper'

feature 'User can delete route', '
  In order to delete old information
  As an authenticated user
  I want to delete route
' do

  given(:user) { create(:user) }
  given!(:route) { create(:route) }

  scenario 'User tries to delete route', js: true do
    sign_in user

    click_on 'Routes'
    click_on 'Destroy'

    expect(current_path).to eq routes_path
    expect(page).to_not have_content route.title
  end
end
