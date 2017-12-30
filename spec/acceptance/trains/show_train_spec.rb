require 'acceptance/acceptance_helper'

feature 'User can see train', '
  In order to see more information
  As an authenticated user
  I want to see train
' do

  given(:user) { create(:user) }
  given!(:train) { create(:train) }

  scenario 'User tries to see train' do
    sign_in user

    click_on 'Trains'
    click_on 'See more ...'

    expect(current_path).to eq train_path(train)
    expect(page).to have_content train.number
  end
end
