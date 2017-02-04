# frozen_string_literal: true
require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'Shows the log in page' do
    get login_path
    assert_response :success
    assert_template 'sessions/new'
  end
end
