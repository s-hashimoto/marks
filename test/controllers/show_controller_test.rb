require 'test_helper'

class ShowControllerTest < ActionController::TestCase
  test "should get top" do
    get :top
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
