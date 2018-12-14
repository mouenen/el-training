require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'when password is invalid' do
      it 'renders the page with error' do
        user = User.find_by(email: 'temp@example.com')
        post :create, session: { email: user.email, password: 'invalid' }
        expect(response).to render_template(:new)
        expect(flash[:alert]).to match(/^Email and password do not match/)
      end
    end

    context 'when password is valid' do
      it 'sets the user in the session and redirects them to their tasks' do
        user = User.find_by(email: 'temp@example.com')
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to '/tasks'
        expect(controller.current_user).to eq user
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys http success' do
      delete :destroy
      expect(response).to have_http_status(:success)
    end
  end
end
