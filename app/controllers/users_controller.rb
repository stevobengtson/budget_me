# frozen_string_literal: true
class UsersController < ApplicationController
  # GET /profile
  def profile
    redirect_to root_url unless logged_in?
    @user = current_user
  end

  # GET /signup
  def signup
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user, false
      redirect_to root_url
    else
      render 'signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
