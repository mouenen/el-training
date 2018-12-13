require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  scenario 'Log in test' do
    visit login_path
    fill_in 'メール', with: 'admin@example.com'
    fill_in 'パスワード', with: 'foobar'
    check 'アカウントを覚える'
    uncheck 'アカウントを覚える'
    click_button 'ログイン'
    expect(page).to have_css 'p#logo'
  end
end
