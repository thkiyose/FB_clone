class UsersController < ApplicationController
  before_action :logged_in_or_redirect, only: [:show]
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

  def logged_in_or_redirect
    redirect_to new_session_path unless current_user
  end
end
