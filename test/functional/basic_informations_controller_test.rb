require 'test_helper'

class BasicInformationsControllerTest < ActionController::TestCase
  setup do
    @basic_information = basic_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_information" do
    assert_difference('BasicInformation.count') do
      post :create, :basic_information => @basic_information.attributes
    end

    assert_redirected_to basic_information_path(assigns(:basic_information))
  end

  test "should show basic_information" do
    get :show, :id => @basic_information.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @basic_information.to_param
    assert_response :success
  end

  test "should update basic_information" do
    put :update, :id => @basic_information.to_param, :basic_information => @basic_information.attributes
    assert_redirected_to basic_information_path(assigns(:basic_information))
  end

  test "should destroy basic_information" do
    assert_difference('BasicInformation.count', -1) do
      delete :destroy, :id => @basic_information.to_param
    end

    assert_redirected_to basic_informations_path
  end
end
