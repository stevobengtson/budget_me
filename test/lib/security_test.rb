# frozen_string_literal: true
require 'test_helper'

class SecurityTest < ActiveSupport::TestCase
  test 'it should digest a string' do
  end

  test "authenticated? should return false with nil digest" do
    assert_not Security.authenticated?('', 'test_token')
  end

  test 'authenticated? should authenticate if valid' do
    assert Security.authenticate?('test_digest', 'test_token')
    refute Security.authenticate?('test_digest', 'bad_token')
  end
end
