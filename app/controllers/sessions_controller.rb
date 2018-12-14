class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:notice] = '歓迎 ' + current_user.name
        redirect_to tasks_path
      else
        flash[:alert] = t(:not_activated)
        redirect_to login_path
      end
    else
      flash[:alert] = t(:invalid_email_password)
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
