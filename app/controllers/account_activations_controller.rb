class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:notice] = t(:account_activated)
      redirect_to user
    else
      flash[:alert] = t(:invalid_activation_link)
      redirect_to root_url
    end
  end
end
