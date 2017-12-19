require 'acceptance/acceptance_helper'

feature 'User can sign out', '
  In order to stop use app
  As an signed user
  I want ot sign out
' do

  given(:user) { create(:user) }

  scenario 'Signed user tries to sign out' do
    sign_in user
    click_on 'Sign out'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(page).to have_link 'Sign in'
  end

  scenario 'Non-signed user tries to sign out' do
    visit root_path

    expect(page).to_not have_link 'Sign out'
  end
end
