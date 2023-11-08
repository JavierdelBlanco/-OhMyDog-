require "application_system_test_case"

class PerrosEncontradosTest < ApplicationSystemTestCase
  setup do
    @perros_encontrado = perros_encontrados(:one)
  end

  test "visiting the index" do
    visit perros_encontrados_url
    assert_selector "h1", text: "Perros encontrados"
  end

  test "should create perros encontrado" do
    visit perros_encontrados_url
    click_on "New perros encontrado"

    fill_in "Descripcion", with: @perros_encontrado.descripcion
    fill_in "Fecha de publicacion", with: @perros_encontrado.fecha_de_publicacion
    fill_in "Foto", with: @perros_encontrado.foto
    fill_in "Mail", with: @perros_encontrado.mail
    fill_in "Nombre", with: @perros_encontrado.nombre
    fill_in "Status", with: @perros_encontrado.status
    click_on "Create Perros encontrado"

    assert_text "Perros encontrado was successfully created"
    click_on "Back"
  end

  test "should update Perros encontrado" do
    visit perros_encontrado_url(@perros_encontrado)
    click_on "Edit this perros encontrado", match: :first

    fill_in "Descripcion", with: @perros_encontrado.descripcion
    fill_in "Fecha de publicacion", with: @perros_encontrado.fecha_de_publicacion
    fill_in "Foto", with: @perros_encontrado.foto
    fill_in "Mail", with: @perros_encontrado.mail
    fill_in "Nombre", with: @perros_encontrado.nombre
    fill_in "Status", with: @perros_encontrado.status
    click_on "Update Perros encontrado"

    assert_text "Perros encontrado was successfully updated"
    click_on "Back"
  end

  test "should destroy Perros encontrado" do
    visit perros_encontrado_url(@perros_encontrado)
    click_on "Destroy this perros encontrado", match: :first

    assert_text "Perros encontrado was successfully destroyed"
  end
end
