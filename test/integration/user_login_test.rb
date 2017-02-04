# frozen_string_literal: true
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin_user)
  end

  test 'login with valid information followed by logout' do
    get login_path
    post login_path, params: {session: {email: @user.email, password: 'password'}}
    assert logged_in_as?(@user)
    assert_redirected_to root_url
    follow_redirect!
    assert_template 'home/index'
    delete logout_path
    assert_not logged_in_as?(@user)
    assert_redirected_to root_url

    # Simulate a user clicking logout in a second window.
    delete logout_path
    assert_not logged_in_as?(@user)
    assert_redirected_to root_url
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {session: {email: @user.email, password: 'badpassword'}}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test 'login with remembering' do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
    # assert_equal cookies['remember_token'], assigns(:user).remember_token
  end

  test 'login without remembering' do
    log_in_as(@user, remember_me: '1')
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
