require 'rails_helper'

RSpec.feature 'AccountActivations', type: :feature do
  include ActiveJob::TestHelper

  scenario 'user successfully signs up and activates account' do
    visit root_path
    click_link '申し込んでください'
    perform_enqueued_jobs do
      expect do
        fill_in '名前', with: 'user_test'
        fill_in 'メール', with: 'user_test@example.com'
        fill_in 'パスワード', with: 'test123'
        fill_in 'パスワード確認', with: 'test123'
        click_button '作成'
      end.to change(User, :count).by(1)
      expect(current_path).to eq login_path
      expect(page).to have_content 'user_testを作成しました。'
    end
    mail = ActionMailer::Base.deliveries.last
    aggregate_failures do
      expect(mail.to).to eq ['user_test@example.com']
      expect(mail.from).to eq ['admin@example.com']
      expect(mail.subject).to eq 'Account activation'
      expect(mail.html_part.body.encoded).to match 'おはようございます user_test'
      expect(mail.html_part.body.encoded).to match 'アクティブ'
    end
  end
end
