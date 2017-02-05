# frozen_string_literal: true
require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  def setup
    @user = users(:admin_user)
  end

  test 'gravatar_for' do
    gravatar_id = Digest::MD5.hexdigest(@user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=32"
    image_wrap = "<img alt=\"#{@user.name}\" class=\"gravatar\" src=\"#{gravatar_url}\" />"
    assert_equal image_wrap, gravatar_for(@user, size: 32)
  end
end
