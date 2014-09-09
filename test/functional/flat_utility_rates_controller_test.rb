require 'test_helper'

class FlatUtilityRatesControllerTest < ActionController::TestCase
  setup do
    @flat_utility_rate = flat_utility_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flat_utility_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flat_utility_rate" do
    assert_difference('FlatUtilityRate.count') do
      post :create, :flat_utility_rate => @flat_utility_rate.attributes
    end

    assert_redirected_to flat_utility_rate_path(assigns(:flat_utility_rate))
  end

  test "should show flat_utility_rate" do
    get :show, :id => @flat_utility_rate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @flat_utility_rate.to_param
    assert_response :success
  end

  test "should update flat_utility_rate" do
    put :update, :id => @flat_utility_rate.to_param, :flat_utility_rate => @flat_utility_rate.attributes
    assert_redirected_to flat_utility_rate_path(assigns(:flat_utility_rate))
  end

  test "should destroy flat_utility_rate" do
    assert_difference('FlatUtilityRate.count', -1) do
      delete :destroy, :id => @flat_utility_rate.to_param
    end

    assert_redirected_to flat_utility_rates_path
  end
end
