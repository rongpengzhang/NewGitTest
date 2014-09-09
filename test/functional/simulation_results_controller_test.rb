require 'test_helper'

class SimulationResultsControllerTest < ActionController::TestCase
  setup do
    @simulation_result = simulation_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulation_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulation_result" do
    assert_difference('SimulationResult.count') do
      post :create, :simulation_result => @simulation_result.attributes
    end

    assert_redirected_to simulation_result_path(assigns(:simulation_result))
  end

  test "should show simulation_result" do
    get :show, :id => @simulation_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @simulation_result.to_param
    assert_response :success
  end

  test "should update simulation_result" do
    put :update, :id => @simulation_result.to_param, :simulation_result => @simulation_result.attributes
    assert_redirected_to simulation_result_path(assigns(:simulation_result))
  end

  test "should destroy simulation_result" do
    assert_difference('SimulationResult.count', -1) do
      delete :destroy, :id => @simulation_result.to_param
    end

    assert_redirected_to simulation_results_path
  end
end
