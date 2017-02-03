require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'Shows the user profile page for me' do
    log_in_as(users(:admin_user))
    get users_me_path
    assert_response :success
    assert_template 'users/show'
  end

  test 'Show the user profile page for user_id' do
    get user_path(users(:admin_user))
    assert_response :success
    assert_template 'users/show'
  end

  test 'Show the sign up page' do
    get signup_path
    assert_response :success
    assert_template 'users/new'
  end
end
