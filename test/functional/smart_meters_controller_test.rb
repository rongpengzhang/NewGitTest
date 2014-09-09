require 'test_helper'

class SmartMetersControllerTest < ActionController::TestCase
  setup do
    @smart_meter = smart_meters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smart_meters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smart_meter" do
    assert_difference('SmartMeter.count') do
      post :create, :smart_meter => @smart_meter.attributes
    end

    assert_redirected_to smart_meter_path(assigns(:smart_meter))
  end

  test "should show smart_meter" do
    get :show, :id => @smart_meter.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @smart_meter.to_param
    assert_response :success
  end

  test "should update smart_meter" do
    put :update, :id => @smart_meter.to_param, :smart_meter => @smart_meter.attributes
    assert_redirected_to smart_meter_path(assigns(:smart_meter))
  end

  test "should destroy smart_meter" do
    assert_difference('SmartMeter.count', -1) do
      delete :destroy, :id => @smart_meter.to_param
    end

    assert_redirected_to smart_meters_path
  end
end
