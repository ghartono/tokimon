require 'test_helper'

class TrainerControllerTest < ActionController::TestCase
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

  test "should get displayinfo" do
    get :displayinfo
    assert_response :success
  end

  test "should get displayall" do
    get :displayall
    assert_response :success
  end

end
