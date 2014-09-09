require 'test_helper'

class RetrofitResultsControllerTest < ActionController::TestCase
  setup do
    @retrofit_result = retrofit_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:retrofit_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create retrofit_result" do
    assert_difference('RetrofitResult.count') do
      post :create, :retrofit_result => @retrofit_result.attributes
    end

    assert_redirected_to retrofit_result_path(assigns(:retrofit_result))
  end

  test "should show retrofit_result" do
    get :show, :id => @retrofit_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @retrofit_result.to_param
    assert_response :success
  end

  test "should update retrofit_result" do
    put :update, :id => @retrofit_result.to_param, :retrofit_result => @retrofit_result.attributes
    assert_redirected_to retrofit_result_path(assigns(:retrofit_result))
  end

  test "should destroy retrofit_result" do
    assert_difference('RetrofitResult.count', -1) do
      delete :destroy, :id => @retrofit_result.to_param
    end

    assert_redirected_to retrofit_results_path
  end
end
