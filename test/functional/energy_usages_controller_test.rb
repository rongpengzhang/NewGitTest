require 'test_helper'

class EnergyUsagesControllerTest < ActionController::TestCase
  setup do
    @energy_usage = energy_usages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:energy_usages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create energy_usage" do
    assert_difference('EnergyUsage.count') do
      post :create, :energy_usage => @energy_usage.attributes
    end

    assert_redirected_to energy_usage_path(assigns(:energy_usage))
  end

  test "should show energy_usage" do
    get :show, :id => @energy_usage.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @energy_usage.to_param
    assert_response :success
  end

  test "should update energy_usage" do
    put :update, :id => @energy_usage.to_param, :energy_usage => @energy_usage.attributes
    assert_redirected_to energy_usage_path(assigns(:energy_usage))
  end

  test "should destroy energy_usage" do
    assert_difference('EnergyUsage.count', -1) do
      delete :destroy, :id => @energy_usage.to_param
    end

    assert_redirected_to energy_usages_path
  end
end
