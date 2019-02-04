require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get gotmk" do
    get :gotmk
    assert_response :success
  end

end
