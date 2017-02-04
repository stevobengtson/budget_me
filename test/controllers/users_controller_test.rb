# frozen_string_literal: true
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'Shows the user profile page for user' do
    log_in_as(users(:admin_user))
    get profile_path
    assert_response :success
    assert_template 'users/profile'
  end

  test 'Show the sign up page' do
    get signup_path
    assert_response :success
    assert_template 'users/signup'
  end
end
