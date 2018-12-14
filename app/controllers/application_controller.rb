class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :remember_user
  skip_before_action :verify_authenticity_token

  def remember_user
    return unless cookies.signed[:user_id]

    user = User.find_by(id: cookies.signed[:user_id])
    if user&.authenticated?(:remember, cookies[:remember_token])
      log_in user
      @current_user = user
    end
  end
end
