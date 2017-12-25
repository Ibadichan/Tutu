require 'acceptance/acceptance_helper'

feature 'User can update route', '
  In order to change information
  As an authenticated user
  I want to update route
' do

  given(:user) { create(:user) }
  given!(:route) { create(:route) }

  describe 'User tries to update route' do
    background do
      sign_in user
      click_on 'Routes'
      click_on 'Update'
    end

    scenario 'with valid attributes' do
      fill_in 'Title', with: 'new title'
      click_on 'Edit'

      expect(current_path).to eq route_path(route)
      expect(page).to have_content 'Route was successfully updated.'
      expect(page).to have_content 'new title'
    end

    scenario 'with invalid attributes' do
      fill_in 'Title', with: ''
      click_on 'Edit'

      expect(page).to have_content 'Route could not be updated.'
      expect(page).to have_content "title can't be blank"
    end
  end
end
