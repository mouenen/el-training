require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do

  describe 'account_activation' do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.account_activation(user) }

    context 'renders the headers' do
      it 'sends with the correct subject' do
        expect(mail.subject).to eq('Account activation')
      end
      it "sends a account_activation email to the user's email address" do
        expect(mail.to).to eq [user.email]
      end
      it 'sends from the support email address' do
        expect(mail.from).to eq ['admin@example.com']
      end
    end

    context 'renders the body' do
      it 'check account activation url' do
        expect(mail.text_part.body.encoded).to include(edit_account_activation_url(user.activation_token, email: user.email))
        expect(mail.html_part.body.encoded).to include(edit_account_activation_url(user.activation_token, email: user.email))
      end
    end
  end
end
