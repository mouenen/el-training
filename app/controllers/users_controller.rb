class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :set_user, only: %i[show edit update]
  before_action :admin_user, only: %i[destroy]

  def index
    @users = User.where(activated: true)
  end

  def show
    redirect_to login_path and return unless logged_in_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:notice] = 'User was successfully created.'
      redirect_to login_path
    else
      flash[:alert] = 'User was unsuccessfully created.'
      render new_user_path
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      render :show
    else
      flash[:alert] = 'User was unsuccessfully updated.'
      render :edit
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      flash[:notice] = 'User was successfully deleted.'
      redirect_to users_path
    else
      flash[:alert] = 'User was unsuccessfully deleted.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
    redirect_back_or users_path unless current_user?(@user)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:alert] = 'Please log in'
      redirect_to login_path
    end
  end

  def admin_user
    redirect_to users_path unless current_user.admin
  end
end