# frozen_string_literal: true
require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  def setup
    @base_title = 'Budget Me'
  end

  test "full title helper" do
    assert_equal full_title, @base_title
    assert_equal full_title("Help"), "#{@base_title} - Help"
  end
end