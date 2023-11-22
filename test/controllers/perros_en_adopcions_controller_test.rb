require "test_helper"

class PerrosEnAdopcionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perros_en_adopcion = perros_en_adopcions(:one)
  end

  test "should get index" do
    get perros_en_adopcions_url
    assert_response :success
  end

  test "should get new" do
    get new_perros_en_adopcion_url
    assert_response :success
  end

  test "should create perros_en_adopcion" do
    assert_difference("PerrosEnAdopcion.count") do
      post perros_en_adopcions_url, params: { perros_en_adopcion: { edad: @perros_en_adopcion.edad, fecha_de_publicacion: @perros_en_adopcion.fecha_de_publicacion, foto: @perros_en_adopcion.foto, nombre: @perros_en_adopcion.nombre, raza: @perros_en_adopcion.raza, sexo: @perros_en_adopcion.sexo, status: @perros_en_adopcion.status, tamano: @perros_en_adopcion.tamano } }
    end

    assert_redirected_to perros_en_adopcion_url(PerrosEnAdopcion.last)
  end

  test "should show perros_en_adopcion" do
    get perros_en_adopcion_url(@perros_en_adopcion)
    assert_response :success
  end

  test "should get edit" do
    get edit_perros_en_adopcion_url(@perros_en_adopcion)
    assert_response :success
  end

  test "should update perros_en_adopcion" do
    patch perros_en_adopcion_url(@perros_en_adopcion), params: { perros_en_adopcion: { edad: @perros_en_adopcion.edad, fecha_de_publicacion: @perros_en_adopcion.fecha_de_publicacion, foto: @perros_en_adopcion.foto, nombre: @perros_en_adopcion.nombre, raza: @perros_en_adopcion.raza, sexo: @perros_en_adopcion.sexo, status: @perros_en_adopcion.status, tamano: @perros_en_adopcion.tamano } }
    assert_redirected_to perros_en_adopcion_url(@perros_en_adopcion)
  end

  test "should destroy perros_en_adopcion" do
    assert_difference("PerrosEnAdopcion.count", -1) do
      delete perros_en_adopcion_url(@perros_en_adopcion)
    end

    assert_redirected_to perros_en_adopcions_url
  end
end
