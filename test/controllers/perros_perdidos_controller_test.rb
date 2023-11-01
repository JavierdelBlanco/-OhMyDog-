require "test_helper"

class PerrosPerdidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perros_perdido = perros_perdidos(:one)
  end

  test "should get index" do
    get perros_perdidos_url
    assert_response :success
  end

  test "should get new" do
    get new_perros_perdido_url
    assert_response :success
  end

  test "should create perros_perdido" do
    assert_difference("PerrosPerdido.count") do
      post perros_perdidos_url, params: { perros_perdido: { fecha_de_publicacion: @perros_perdido.fecha_de_publicacion, foto: @perros_perdido.foto, nombre: @perros_perdido.nombre, status: @perros_perdido.status } }
    end

    assert_redirected_to perros_perdido_url(PerrosPerdido.last)
  end

  test "should show perros_perdido" do
    get perros_perdido_url(@perros_perdido)
    assert_response :success
  end

  test "should get edit" do
    get edit_perros_perdido_url(@perros_perdido)
    assert_response :success
  end

  test "should update perros_perdido" do
    patch perros_perdido_url(@perros_perdido), params: { perros_perdido: { fecha_de_publicacion: @perros_perdido.fecha_de_publicacion, foto: @perros_perdido.foto, nombre: @perros_perdido.nombre, status: @perros_perdido.status } }
    assert_redirected_to perros_perdido_url(@perros_perdido)
  end

  test "should destroy perros_perdido" do
    assert_difference("PerrosPerdido.count", -1) do
      delete perros_perdido_url(@perros_perdido)
    end

    assert_redirected_to perros_perdidos_url
  end
end
