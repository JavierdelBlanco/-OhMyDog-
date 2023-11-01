require "application_system_test_case"

class PerrosPerdidosTest < ApplicationSystemTestCase
  setup do
    @perros_perdido = perros_perdidos(:one)
  end

  test "visiting the index" do
    visit perros_perdidos_url
    assert_selector "h1", text: "Perros perdidos"
  end

  test "should create perros perdido" do
    visit perros_perdidos_url
    click_on "New perros perdido"

    fill_in "Fecha de publicacion", with: @perros_perdido.fecha_de_publicacion
    fill_in "Foto", with: @perros_perdido.foto
    fill_in "Nombre", with: @perros_perdido.nombre
    fill_in "Status", with: @perros_perdido.status
    click_on "Create Perros perdido"

    assert_text "Perros perdido was successfully created"
    click_on "Back"
  end

  test "should update Perros perdido" do
    visit perros_perdido_url(@perros_perdido)
    click_on "Edit this perros perdido", match: :first

    fill_in "Fecha de publicacion", with: @perros_perdido.fecha_de_publicacion
    fill_in "Foto", with: @perros_perdido.foto
    fill_in "Nombre", with: @perros_perdido.nombre
    fill_in "Status", with: @perros_perdido.status
    click_on "Update Perros perdido"

    assert_text "Perros perdido was successfully updated"
    click_on "Back"
  end

  test "should destroy Perros perdido" do
    visit perros_perdido_url(@perros_perdido)
    click_on "Destroy this perros perdido", match: :first

    assert_text "Perros perdido was successfully destroyed"
  end
end
