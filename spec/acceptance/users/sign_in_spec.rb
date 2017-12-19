require 'acceptance/acceptance_helper'

feature 'User can sign in', '
  In order to use application
  As an registered user
  I want to sign in
' do

  given(:user) { create(:user) }

  background { visit root_path }

  scenario 'Registered user tries to sign in' do
    click_on 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'Non registered user tries to sign in' do
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end

  scenario 'User tries to sign in with invalid attributes' do
    click_on 'Sign in'

    fill_in 'Email', with: 'fake@mail.com'
    fill_in 'Password', with: '1234566'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
  end
end
