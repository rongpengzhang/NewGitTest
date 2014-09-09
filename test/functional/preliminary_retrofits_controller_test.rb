require 'test_helper'

class PreliminaryRetrofitsControllerTest < ActionController::TestCase
  setup do
    @preliminary_retrofit = preliminary_retrofits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preliminary_retrofits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preliminary_retrofit" do
    assert_difference('PreliminaryRetrofit.count') do
      post :create, :preliminary_retrofit => @preliminary_retrofit.attributes
    end

    assert_redirected_to preliminary_retrofit_path(assigns(:preliminary_retrofit))
  end

  test "should show preliminary_retrofit" do
    get :show, :id => @preliminary_retrofit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @preliminary_retrofit.to_param
    assert_response :success
  end

  test "should update preliminary_retrofit" do
    put :update, :id => @preliminary_retrofit.to_param, :preliminary_retrofit => @preliminary_retrofit.attributes
    assert_redirected_to preliminary_retrofit_path(assigns(:preliminary_retrofit))
  end

  test "should destroy preliminary_retrofit" do
    assert_difference('PreliminaryRetrofit.count', -1) do
      delete :destroy, :id => @preliminary_retrofit.to_param
    end

    assert_redirected_to preliminary_retrofits_path
  end
end
