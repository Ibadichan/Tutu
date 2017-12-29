require 'acceptance/acceptance_helper'

feature 'User can see list of trains', '
  In order to manage trains
  As an authenticated user
  I want ot see list of trains
' do

  given(:user)    { create(:user) }
  given!(:trains) { create_list(:train, 2) }

  scenario 'User tries to see list of trains' do
    sign_in user

    click_on 'Trains'

    trains.each { |train| expect(page).to have_content train.number }
  end
end
