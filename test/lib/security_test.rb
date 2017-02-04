# frozen_string_literal: true
require 'test_helper'

class SecurityTest < ActiveSupport::TestCase
  test 'digest' do
    refute_nil Security.digest('test_token')
  end

  test 'new_token' do
    assert_match(/[\w]+/, Security.new_token)
  end

  test 'authenticated? should return false with nil digest' do
    assert_not Security.authenticated?('', 'test_token')
  end

  test 'authenticated? should authenticate if valid' do
    digest = Security.digest('test_token')
    assert Security.authenticated?(digest, 'test_token')
    refute Security.authenticated?(digest, 'bad_token')
  end

  test 'find_and_authenticate_user' do
    user = users(:admin_user)
    user.remember
    assert user, Security.find_and_authenticate_user(user, user.remember_token)
  end
end
