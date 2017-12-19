require 'acceptance/acceptance_helper'

feature 'User can sign up', '
  In order to be able to sign in
  As an not-registered user
  I want to sign up
' do

  background do
    visit root_path
    click_on 'Sign in'
    click_on 'Sign up'
  end

  scenario 'User tries to register with valid attributes' do
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    open_email('user@example.com')
    current_email.click_link('Confirm my account')

    expect(page).to have_content 'Your email address has been successfully confirmed.'
  end

  scenario 'User tries to register with invalid attributes' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_on 'Sign up'

    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "Email can't be blank"
  end
end
