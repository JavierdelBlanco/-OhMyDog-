require "test_helper"

class PerritosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perrito = perritos(:one)
  end

  test "should get index" do
    get perritos_url
    assert_response :success
  end

  test "should get new" do
    get new_perrito_url
    assert_response :success
  end

  test "should create perrito" do
    assert_difference("Perrito.count") do
      post perritos_url, params: { perrito: { año: @perrito.año, caracteristicas: @perrito.caracteristicas, color: @perrito.color, condiciones: @perrito.condiciones, dia: @perrito.dia, mes: @perrito.mes, nombre: @perrito.nombre, raza: @perrito.raza, tamaño: @perrito.tamaño, user_id: @perrito.user_id } }
    end

    assert_redirected_to perrito_url(Perrito.last)
  end

  test "should show perrito" do
    get perrito_url(@perrito)
    assert_response :success
  end

  test "should get edit" do
    get edit_perrito_url(@perrito)
    assert_response :success
  end

  test "should update perrito" do
    patch perrito_url(@perrito), params: { perrito: { año: @perrito.año, caracteristicas: @perrito.caracteristicas, color: @perrito.color, condiciones: @perrito.condiciones, dia: @perrito.dia, mes: @perrito.mes, nombre: @perrito.nombre, raza: @perrito.raza, tamaño: @perrito.tamaño, user_id: @perrito.user_id } }
    assert_redirected_to perrito_url(@perrito)
  end

  test "should destroy perrito" do
    assert_difference("Perrito.count", -1) do
      delete perrito_url(@perrito)
    end

    assert_redirected_to perritos_url
  end
end
