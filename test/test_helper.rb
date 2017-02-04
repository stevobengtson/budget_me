# frozen_string_literal: true
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'App Libraries', 'app/lib'

  minimum_coverage 90
  refuse_coverage_drop
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # Returns true if a test user is logged in.
  def logged_in_as?(user)
    !session[:user_id].nil? && session[:user_id] == user.id
  end

  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  fixtures :all

  # Log in as a particular user.
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: {session: {email:       user.email,
                                        password:    password,
                                        remember_me: remember_me}}
  end
end
