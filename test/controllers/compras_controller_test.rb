require 'test_helper'

class ComprasControllerTest < ActionController::TestCase
  test "should get compra_correcta" do
    get :compra_correcta
    assert_response :success
  end

  test "should get notificaciones" do
    get :notificaciones
    assert_response :success
  end

end
