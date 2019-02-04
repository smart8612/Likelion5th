require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get home_login" do
    get :home_login
    assert_response :success
  end

  test "should get home_logout" do
    get :home_logout
    assert_response :success
  end

  test "should get write" do
    get :write
    assert_response :success
  end

  test "should get myprofile" do
    get :myprofile
    assert_response :success
  end

  test "should get mylist" do
    get :mylist
    assert_response :success
  end

  test "should get post_update" do
    get :post_update
    assert_response :success
  end

  test "should get list_update" do
    get :list_update
    assert_response :success
  end

end
