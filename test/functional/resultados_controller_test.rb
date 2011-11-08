require 'test_helper'

class ResultadosControllerTest < ActionController::TestCase
  test "should get generar" do
    get :generar
    assert_response :success
  end

  test "should get ver" do
    get :ver
    assert_response :success
  end

end
