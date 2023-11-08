require "application_system_test_case"

class PerritosTest < ApplicationSystemTestCase
  setup do
    @perrito = perritos(:one)
  end

  test "visiting the index" do
    visit perritos_url
    assert_selector "h1", text: "Perritos"
  end

  test "should create perrito" do
    visit perritos_url
    click_on "New perrito"

    fill_in "Año", with: @perrito.año
    fill_in "Caracteristicas", with: @perrito.caracteristicas
    fill_in "Color", with: @perrito.color
    fill_in "Condiciones", with: @perrito.condiciones
    fill_in "Dia", with: @perrito.dia
    fill_in "Mes", with: @perrito.mes
    fill_in "Nombre", with: @perrito.nombre
    fill_in "Raza", with: @perrito.raza
    fill_in "Tamaño", with: @perrito.tamaño
    fill_in "User", with: @perrito.user_id
    click_on "Create Perrito"

    assert_text "Perrito was successfully created"
    click_on "Back"
  end

  test "should update Perrito" do
    visit perrito_url(@perrito)
    click_on "Edit this perrito", match: :first

    fill_in "Año", with: @perrito.año
    fill_in "Caracteristicas", with: @perrito.caracteristicas
    fill_in "Color", with: @perrito.color
    fill_in "Condiciones", with: @perrito.condiciones
    fill_in "Dia", with: @perrito.dia
    fill_in "Mes", with: @perrito.mes
    fill_in "Nombre", with: @perrito.nombre
    fill_in "Raza", with: @perrito.raza
    fill_in "Tamaño", with: @perrito.tamaño
    fill_in "User", with: @perrito.user_id
    click_on "Update Perrito"

    assert_text "Perrito was successfully updated"
    click_on "Back"
  end

  test "should destroy Perrito" do
    visit perrito_url(@perrito)
    click_on "Destroy this perrito", match: :first

    assert_text "Perrito was successfully destroyed"
  end
end
