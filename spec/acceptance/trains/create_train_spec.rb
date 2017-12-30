require 'acceptance/acceptance_helper'

feature 'User can create train', '
  In order to expand application
  As an authenticated user
  I want to create train
' do

  given(:user) { create(:user) }

  describe 'User tries to create train' do
    background do
      sign_in user
      click_on 'Trains'
      click_on 'Add Train'
    end

    scenario 'with valid attributes' do
      fill_in 'Number', with: 'my title'
      click_on 'Create'

      expect(current_path).to eq train_path(Train.last)
      expect(page).to have_content Train.last.number
      expect(page).to have_content 'Train was successfully created.'
    end

    scenario 'with invalid attributes' do
      fill_in 'Number', with: ''
      click_on 'Create'

      expect(page).to have_content 'Train could not be created.'
      expect(page).to have_content "number can't be blank"
    end
  end
end
