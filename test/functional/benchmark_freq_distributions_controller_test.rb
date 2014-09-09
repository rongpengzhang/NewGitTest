require 'test_helper'

class BenchmarkFreqDistributionsControllerTest < ActionController::TestCase
  setup do
    @benchmark_freq_distribution = benchmark_freq_distributions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:benchmark_freq_distributions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create benchmark_freq_distribution" do
    assert_difference('BenchmarkFreqDistribution.count') do
      post :create, :benchmark_freq_distribution => @benchmark_freq_distribution.attributes
    end

    assert_redirected_to benchmark_freq_distribution_path(assigns(:benchmark_freq_distribution))
  end

  test "should show benchmark_freq_distribution" do
    get :show, :id => @benchmark_freq_distribution.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @benchmark_freq_distribution.to_param
    assert_response :success
  end

  test "should update benchmark_freq_distribution" do
    put :update, :id => @benchmark_freq_distribution.to_param, :benchmark_freq_distribution => @benchmark_freq_distribution.attributes
    assert_redirected_to benchmark_freq_distribution_path(assigns(:benchmark_freq_distribution))
  end

  test "should destroy benchmark_freq_distribution" do
    assert_difference('BenchmarkFreqDistribution.count', -1) do
      delete :destroy, :id => @benchmark_freq_distribution.to_param
    end

    assert_redirected_to benchmark_freq_distributions_path
  end
end
