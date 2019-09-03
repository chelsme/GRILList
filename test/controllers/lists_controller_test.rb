require 'test_helper'

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lists_path
    assert_response :success
  end

  test "should get new" do
    get new_list_path
    assert_response :success
  end

  test "should get show" do
    list = lists(:one)
    get list_path(list)
    assert_response :success
  end

  test "should get edit" do
    list = lists(:one)
    get edit_list_path(list)
    assert_response :success
  end

end
