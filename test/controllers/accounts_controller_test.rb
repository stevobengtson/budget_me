# frozen_string_literal: true
require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:normal_user)
    @account = accounts(:checking)
    @checking_account_id = account_types(:checking_type).id
    log_in_as(@user)
  end

  test 'should get index' do
    get accounts_url
    assert_response :success
  end

  test 'should get new' do
    get new_account_url
    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post accounts_url, params: {account: {account_type_id: @checking_account_id, balance: 500.00, name: 'Test Account', note: 'Nothing'}}
    end
    assert_redirected_to account_url(assigns(:account))
  end

  test 'should show account' do
    get account_url(@account)
    assert_response :success
  end

  test 'should get edit' do
    get edit_account_url(@account)
    assert_response :success
  end

  test 'should update account' do
    patch account_url(@account), params: {account: {account_type_id: @checking_account_id, balance: 999.99, name: 'New Name', note: 'New Note'}}
    assert_redirected_to account_url(@account)
  end

  test 'should destroy account' do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end
    assert_redirected_to accounts_url
  end
end
