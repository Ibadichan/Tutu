require 'acceptance/acceptance_helper'

feature 'User can create route', '
  In order to expand application
  As an authenticated user
  I want to create route
' do

  given(:user) { create(:user) }

  describe 'User tries to create route' do
    background do
      sign_in user
      click_on 'Routes'
      click_on 'Add Route'
    end

    scenario 'with valid attributes' do
      fill_in 'Title', with: 'my title'
      click_on 'Create'

      expect(current_path).to eq route_path(Route.last)
      expect(page).to have_content Route.last.title
      expect(page).to have_content 'Route was successfully created.'
    end

    scenario 'with invalid attributes' do
      fill_in 'Title', with: ''
      click_on 'Create'

      expect(page).to have_content 'Route could not be created.'
      expect(page).to have_content "title can't be blank"
    end
  end
end
