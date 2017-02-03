class UsersController < ApplicationController
  def show
    user_id = params[:id] == 'me' ? current_user.try(:id) : params[:id]
    redirect_to root_url unless user_id.present?
    @user = User.find(user_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user, false
      redirect_to root_url
    else
      render new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
