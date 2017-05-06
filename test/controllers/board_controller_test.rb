require 'test_helper'

class BoardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get simple" do
    get :simple
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
