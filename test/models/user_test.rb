require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'test.email@example.com', password: 'testpass', password_confirmation: 'testpass')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = '      '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = '      '
    assert_not @user.valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 256
    assert_not @user.valid?
  end

  test 'email should not be too long' do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email address should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'email address should be saved as lowercase' do
    mixed_case_email = 'MixedCase@Example.com'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not @user.valid?
  end

  test 'password should have a minumum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not @user.valid?
  end

  test 'should set remember attributes' do
    Security.expects(:new_token).returns('test_token')
    Security.expects(:digest).with('test_token').returns('abcdefg1234')
    user = users(:admin_user)
    user.remember
    assert_equal 'test_token', user.remember_token
    assert_equal 'abcdefg1234', user.reload.remember_digest
  end

  test 'should unset remember attributes' do
    user = users(:admin_user)
    user.remember_digest = 'abcdefg1234'
    user.forget
    assert_nil user.reload.remember_digest
  end
end
