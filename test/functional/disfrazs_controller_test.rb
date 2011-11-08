require 'test_helper'

class DisfrazsControllerTest < ActionController::TestCase
  setup do
    @disfraz = disfrazs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disfrazs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disfraz" do
    assert_difference('Disfraz.count') do
      post :create, disfraz: @disfraz.attributes
    end

    assert_redirected_to disfraz_path(assigns(:disfraz))
  end

  test "should show disfraz" do
    get :show, id: @disfraz.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disfraz.to_param
    assert_response :success
  end

  test "should update disfraz" do
    put :update, id: @disfraz.to_param, disfraz: @disfraz.attributes
    assert_redirected_to disfraz_path(assigns(:disfraz))
  end

  test "should destroy disfraz" do
    assert_difference('Disfraz.count', -1) do
      delete :destroy, id: @disfraz.to_param
    end

    assert_redirected_to disfrazs_path
  end
end
