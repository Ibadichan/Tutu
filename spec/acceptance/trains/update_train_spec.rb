require 'acceptance/acceptance_helper'

feature 'User can update train', '
  In order to change information
  As an authenticated user
  I want to update train
' do

  given(:user) { create(:user) }
  given!(:train) { create(:train) }

  describe 'User tries to update train' do
    background do
      sign_in user
      click_on 'Trains'
      click_on 'Update'
    end

    scenario 'with valid attributes' do
      fill_in 'Number', with: 'new title'
      click_on 'Edit'

      expect(current_path).to eq train_path(train)
      expect(page).to have_content 'Train was successfully updated.'
      expect(page).to have_content 'new title'
    end

    scenario 'with invalid attributes' do
      fill_in 'Number', with: ''
      click_on 'Edit'

      expect(page).to have_content 'Train could not be updated.'
      expect(page).to have_content "number can't be blank"
    end
  end
end
