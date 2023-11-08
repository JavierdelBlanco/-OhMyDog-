require "test_helper"

class PerrosEncontradosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perros_encontrado = perros_encontrados(:one)
  end

  test "should get index" do
    get perros_encontrados_url
    assert_response :success
  end

  test "should get new" do
    get new_perros_encontrado_url
    assert_response :success
  end

  test "should create perros_encontrado" do
    assert_difference("PerrosEncontrado.count") do
      post perros_encontrados_url, params: { perros_encontrado: { descripcion: @perros_encontrado.descripcion, fecha_de_publicacion: @perros_encontrado.fecha_de_publicacion, foto: @perros_encontrado.foto, mail: @perros_encontrado.mail, nombre: @perros_encontrado.nombre, status: @perros_encontrado.status } }
    end

    assert_redirected_to perros_encontrado_url(PerrosEncontrado.last)
  end

  test "should show perros_encontrado" do
    get perros_encontrado_url(@perros_encontrado)
    assert_response :success
  end

  test "should get edit" do
    get edit_perros_encontrado_url(@perros_encontrado)
    assert_response :success
  end

  test "should update perros_encontrado" do
    patch perros_encontrado_url(@perros_encontrado), params: { perros_encontrado: { descripcion: @perros_encontrado.descripcion, fecha_de_publicacion: @perros_encontrado.fecha_de_publicacion, foto: @perros_encontrado.foto, mail: @perros_encontrado.mail, nombre: @perros_encontrado.nombre, status: @perros_encontrado.status } }
    assert_redirected_to perros_encontrado_url(@perros_encontrado)
  end

  test "should destroy perros_encontrado" do
    assert_difference("PerrosEncontrado.count", -1) do
      delete perros_encontrado_url(@perros_encontrado)
    end

    assert_redirected_to perros_encontrados_url
  end
end
