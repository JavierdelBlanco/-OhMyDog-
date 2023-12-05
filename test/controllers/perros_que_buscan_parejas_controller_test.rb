require "test_helper"

class PerrosQueBuscanParejasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perros_que_buscan_pareja = perros_que_buscan_parejas(:one)
  end

  test "should get index" do
    get perros_que_buscan_parejas_url
    assert_response :success
  end

  test "should get new" do
    get new_perros_que_buscan_pareja_url
    assert_response :success
  end

  test "should create perros_que_buscan_pareja" do
    assert_difference("PerrosQueBuscanPareja.count") do
      post perros_que_buscan_parejas_url, params: { perros_que_buscan_pareja: { caracteristicas: @perros_que_buscan_pareja.caracteristicas, color: @perros_que_buscan_pareja.color, condiciones: @perros_que_buscan_pareja.condiciones, fecha_de_nacimiento: @perros_que_buscan_pareja.fecha_de_nacimiento, nombre: @perros_que_buscan_pareja.nombre, raza: @perros_que_buscan_pareja.raza, sexo: @perros_que_buscan_pareja.sexo, tamano: @perros_que_buscan_pareja.tamano } }
    end

    assert_redirected_to perros_que_buscan_pareja_url(PerrosQueBuscanPareja.last)
  end

  test "should show perros_que_buscan_pareja" do
    get perros_que_buscan_pareja_url(@perros_que_buscan_pareja)
    assert_response :success
  end

  test "should get edit" do
    get edit_perros_que_buscan_pareja_url(@perros_que_buscan_pareja)
    assert_response :success
  end

  test "should update perros_que_buscan_pareja" do
    patch perros_que_buscan_pareja_url(@perros_que_buscan_pareja), params: { perros_que_buscan_pareja: { caracteristicas: @perros_que_buscan_pareja.caracteristicas, color: @perros_que_buscan_pareja.color, condiciones: @perros_que_buscan_pareja.condiciones, fecha_de_nacimiento: @perros_que_buscan_pareja.fecha_de_nacimiento, nombre: @perros_que_buscan_pareja.nombre, raza: @perros_que_buscan_pareja.raza, sexo: @perros_que_buscan_pareja.sexo, tamano: @perros_que_buscan_pareja.tamano } }
    assert_redirected_to perros_que_buscan_pareja_url(@perros_que_buscan_pareja)
  end

  test "should destroy perros_que_buscan_pareja" do
    assert_difference("PerrosQueBuscanPareja.count", -1) do
      delete perros_que_buscan_pareja_url(@perros_que_buscan_pareja)
    end

    assert_redirected_to perros_que_buscan_parejas_url
  end
end
