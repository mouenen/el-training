require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'password_reset' do
    let(:user) { FactoryBot.build(:user) }
    let(:mail) { UserMailer.password_reset(user) }

    context 'renders the headers' do
      it 'sends with the correct subject' do
        expect(mail.subject).to eq('Password reset')
      end
      it "sends a password_reset email to the user's email address" do
        expect(mail.to).to eq [user.email]
      end
      it 'sends from the support email address' do
        expect(mail.from).to eq ['admin@example.com']
      end
    end

    context 'renders the body' do
      it 'check password_reset url' do
        expect(mail.text_part.body.encoded).to include(edit_password_reset_url(user.reset_token, email: user.email))
        expect(mail.html_part.body.encoded).to include(edit_password_reset_url(user.reset_token, email: user.email))
      end
    end
  end
end
