require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  scenario 'Log in test' do
    visit login_path
    fill_in 'Email', with: 'temp@example.com'
    fill_in 'Password', with: 'foobar'
    page.check('session_remember_me')
    click_button 'Log in'
    # click_on 'Sign up'
    expect(page).to have_css 'p#logo'
  end
end
