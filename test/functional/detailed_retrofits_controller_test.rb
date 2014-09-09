require 'test_helper'

class DetailedRetrofitsControllerTest < ActionController::TestCase
  setup do
    @detailed_retrofit = detailed_retrofits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detailed_retrofits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detailed_retrofit" do
    assert_difference('DetailedRetrofit.count') do
      post :create, :detailed_retrofit => @detailed_retrofit.attributes
    end

    assert_redirected_to detailed_retrofit_path(assigns(:detailed_retrofit))
  end

  test "should show detailed_retrofit" do
    get :show, :id => @detailed_retrofit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @detailed_retrofit.to_param
    assert_response :success
  end

  test "should update detailed_retrofit" do
    put :update, :id => @detailed_retrofit.to_param, :detailed_retrofit => @detailed_retrofit.attributes
    assert_redirected_to detailed_retrofit_path(assigns(:detailed_retrofit))
  end

  test "should destroy detailed_retrofit" do
    assert_difference('DetailedRetrofit.count', -1) do
      delete :destroy, :id => @detailed_retrofit.to_param
    end

    assert_redirected_to detailed_retrofits_path
  end
end
