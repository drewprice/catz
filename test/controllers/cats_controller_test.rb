require 'test_helper'

class CatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get moar" do
    get :moar
    assert_response :success
  end

  test "should get save" do
    get :save
    assert_response :success
  end

end
