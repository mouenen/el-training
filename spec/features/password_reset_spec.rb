require 'rails_helper'

RSpec.feature 'PasswordReset', type: :feature do
  include ActiveJob::TestHelper

  scenario 'user forgeted password and successfully resets password' do
    visit root_path
    click_link '(パスワードを忘れました?)'
    perform_enqueued_jobs do
      expect do
        fill_in 'メール', with: 'user_test@example.com'
        click_button '提出'
      end.to_not change(User, :count)
      expect(current_path).to eq login_path
      expect(page).to have_content 'パスワードをリセットするメールが送信しました。'
    end
    mail = ActionMailer::Base.deliveries.last
    aggregate_failures do
      expect(mail.to).to eq ['user_test@example.com']
      expect(mail.from).to eq ['admin@example.com']
      expect(mail.subject).to eq 'Password reset'
      expect(mail.html_part.body.encoded).to match 'おはようございます user_test'
      expect(mail.html_part.body.encoded).to match 'パスワードをリセットする'
    end
  end
end
