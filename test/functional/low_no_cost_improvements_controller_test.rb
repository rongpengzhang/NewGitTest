require 'test_helper'

class LowNoCostImprovementsControllerTest < ActionController::TestCase
  setup do
    @low_no_cost_improvement = low_no_cost_improvements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:low_no_cost_improvements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create low_no_cost_improvement" do
    assert_difference('LowNoCostImprovement.count') do
      post :create, :low_no_cost_improvement => @low_no_cost_improvement.attributes
    end

    assert_redirected_to low_no_cost_improvement_path(assigns(:low_no_cost_improvement))
  end

  test "should show low_no_cost_improvement" do
    get :show, :id => @low_no_cost_improvement.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @low_no_cost_improvement.to_param
    assert_response :success
  end

  test "should update low_no_cost_improvement" do
    put :update, :id => @low_no_cost_improvement.to_param, :low_no_cost_improvement => @low_no_cost_improvement.attributes
    assert_redirected_to low_no_cost_improvement_path(assigns(:low_no_cost_improvement))
  end

  test "should destroy low_no_cost_improvement" do
    assert_difference('LowNoCostImprovement.count', -1) do
      delete :destroy, :id => @low_no_cost_improvement.to_param
    end

    assert_redirected_to low_no_cost_improvements_path
  end
end
