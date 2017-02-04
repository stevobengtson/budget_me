# frozen_string_literal: true
require 'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:admin_user)
  end

  test 'log_in and log_out' do
    log_in @user, true
    assert logged_in?

    log_out
    assert_nil @current_user
    assert_nil session[:user_id]
    assert_nil cookies[:remember_token]
    assert_nil cookies.signed[:user_id]
  end

  test 'remember and forget' do
    remember @user
    assert_equal @user.remember_token, cookies[:remember_token]
    assert_equal @user.id, cookies.signed[:user_id]

    forget @user
    assert_nil cookies[:remember_token]
    assert_nil cookies.signed[:user_id]
  end

  test 'current_user' do
    log_in_as @user
    assert_equal @user, current_user

    session.delete(:user_id)
    remember @user
    assert_equal @user, current_user
  end

  test 'logged_in?' do
    refute logged_in?
    log_in_as @user
    assert logged_in?
  end
end
