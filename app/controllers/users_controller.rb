class UsersController < ApplicationController
  before_action :can_if_logged_in, only: [:show]
  before_action :can_if_not_logged_in, only: [:new,:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def current_user
    current_user ||= User.find(session[:user_id])
  end

  def can_if_logged_in
    redirect_to new_session_path unless current_user
  end

  def can_if_not_logged_in
    redirect_to user_path(current_user.id) if current_user
  end
end
