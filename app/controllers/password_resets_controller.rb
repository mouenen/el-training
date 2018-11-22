class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit uodate]
  before_action :check_expiration, only: %i[edit update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:notice] = 'Email sent with password reset instructions'
      redirect_to login_path
    else
      flash.now[:alert] = 'Email address not found'
      render 'new'
    end
  end

  def edit    
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:notice] = 'Password has been reset.'
      redirect_to login_path
    else
      render 'edit'
    end
  end
 
  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to login_path
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:alert] = 'Password reset has expired.'
      redirect_to new_password_reset_path
    end
  end
end
