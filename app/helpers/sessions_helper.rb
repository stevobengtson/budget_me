# frozen_string_literal: true
module SessionsHelper
  def log_in(user, remember_user)
    session[:user_id] = user.id
    remember_user ? remember(user) : forget(user)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user
    @current_user = current_user_by_session
    return @current_user unless @current_user.nil?
    @current_user = current_user_by_cookies
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def current_user_by_session
    @current_user ||= User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end

  def current_user_by_cookies
    @current_user ||= Security.find_and_authenticate_user(cookies.signed[:user_id], cookies[:remember_token]) if cookies.signed[:user_id]
    return @current_user if @current_user.nil?
    log_in @current_user, true
    @current_user
  end
end
