# frozen_string_literal: true
class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :signup]

  def new; end

  def create
    user = Security.authenticate_user(params[:session][:email], params[:session][:password])
    if user
      log_in user, params[:session][:remember_me].try(:true?)
      redirect_to transactions_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # GET /signup
  def signup
    @user = User.new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
