# frozen_string_literal: true
require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:electricity)
    @user = users(:normal_user)
    log_in_as(@user)
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_url, params: {category: {category_group_id: @category.category_group_id, name: 'Test Category'}}
    end
    assert_redirected_to category_url(assigns(:category))
  end

  test 'should show category' do
    get category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    patch category_url(@category), params: {category: {category_group_id: @category.category_group_id, name: 'Test Category'}}
    assert_redirected_to category_url(@category)
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end
    assert_redirected_to categories_url
  end
end
