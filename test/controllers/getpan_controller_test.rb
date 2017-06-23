require 'test_helper'

class GetpanControllerTest < ActionController::TestCase
  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get error" do
    get :error
    assert_response :success
  end

end
