require "test_helper"

class CuidadorPaseadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuidador_paseador = cuidador_paseadors(:one)
  end

  test "should get index" do
    get cuidador_paseadors_url
    assert_response :success
  end

  test "should get new" do
    get new_cuidador_paseador_url
    assert_response :success
  end

  test "should create cuidador_paseador" do
    assert_difference("CuidadorPaseador.count") do
      post cuidador_paseadors_url, params: { cuidador_paseador: { apellido: @cuidador_paseador.apellido, foto: @cuidador_paseador.foto, horarios: @cuidador_paseador.horarios, nombre: @cuidador_paseador.nombre, rol: @cuidador_paseador.rol } }
    end

    assert_redirected_to cuidador_paseador_url(CuidadorPaseador.last)
  end

  test "should show cuidador_paseador" do
    get cuidador_paseador_url(@cuidador_paseador)
    assert_response :success
  end

  test "should get edit" do
    get edit_cuidador_paseador_url(@cuidador_paseador)
    assert_response :success
  end

  test "should update cuidador_paseador" do
    patch cuidador_paseador_url(@cuidador_paseador), params: { cuidador_paseador: { apellido: @cuidador_paseador.apellido, foto: @cuidador_paseador.foto, horarios: @cuidador_paseador.horarios, nombre: @cuidador_paseador.nombre, rol: @cuidador_paseador.rol } }
    assert_redirected_to cuidador_paseador_url(@cuidador_paseador)
  end

  test "should destroy cuidador_paseador" do
    assert_difference("CuidadorPaseador.count", -1) do
      delete cuidador_paseador_url(@cuidador_paseador)
    end

    assert_redirected_to cuidador_paseadors_url
  end
end
