class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'Welcome ' + current_user.name
      redirect_to tasks_path
    else
      flash[:alert] = 'Invalid email/password combination.'
      render 'new'
    end
  end
end
