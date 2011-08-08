require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get change" do
    get :change
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
