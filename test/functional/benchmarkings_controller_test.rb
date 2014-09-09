require 'test_helper'

class BenchmarkingsControllerTest < ActionController::TestCase
  setup do
    @benchmarking = benchmarkings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benchmarkings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benchmarking" do
    assert_difference('Benchmarking.count') do
      post :create, :benchmarking => @benchmarking.attributes
    end

    assert_redirected_to benchmarking_path(assigns(:benchmarking))
  end

  test "should show benchmarking" do
    get :show, :id => @benchmarking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @benchmarking.to_param
    assert_response :success
  end

  test "should update benchmarking" do
    put :update, :id => @benchmarking.to_param, :benchmarking => @benchmarking.attributes
    assert_redirected_to benchmarking_path(assigns(:benchmarking))
  end

  test "should destroy benchmarking" do
    assert_difference('Benchmarking.count', -1) do
      delete :destroy, :id => @benchmarking.to_param
    end

    assert_redirected_to benchmarkings_path
  end
end
