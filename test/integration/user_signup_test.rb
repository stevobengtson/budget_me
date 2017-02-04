# frozen_string_literal: true
require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {name:                  'Example User',
                                       email:                 'user@example.com',
                                       password:              'password',
                                       password_confirmation: 'password'}}
    end
    assert logged_in_as?(assigns(:user))
    follow_redirect!
    assert_template 'home/index'
  end

  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: {user: {name:                  '',
                                       email:                 'user@invalid',
                                       password:              'foo',
                                       password_confirmation: 'bar'}}
    end
    assert_template 'users/signup'
  end
end
