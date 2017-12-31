require 'acceptance/acceptance_helper'

feature 'User can delete train', '
  In order to delete old information
  As an authenticated user
  I want to delete train
' do

  given(:user) { create(:user) }
  given!(:train) { create(:train) }

  scenario 'User tries to delete train', js: true do
    sign_in user

    click_on 'Trains'
    click_on 'Destroy'

    expect(current_path).to eq trains_path
    expect(page).to_not have_content train.number
  end
end
