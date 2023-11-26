require "application_system_test_case"

class PerrosEnAdopcionsTest < ApplicationSystemTestCase
  setup do
    @perros_en_adopcion = perros_en_adopcions(:one)
  end

  test "visiting the index" do
    visit perros_en_adopcions_url
    assert_selector "h1", text: "Perros en adopcions"
  end

  test "should create perros en adopcion" do
    visit perros_en_adopcions_url
    click_on "New perros en adopcion"

    fill_in "Edad", with: @perros_en_adopcion.edad
    fill_in "Fecha de publicacion", with: @perros_en_adopcion.fecha_de_publicacion
    fill_in "Foto", with: @perros_en_adopcion.foto
    fill_in "Nombre", with: @perros_en_adopcion.nombre
    fill_in "Raza", with: @perros_en_adopcion.raza
    fill_in "Sexo", with: @perros_en_adopcion.sexo
    check "Status" if @perros_en_adopcion.status
    fill_in "Tamano", with: @perros_en_adopcion.tamano
    click_on "Create Perros en adopcion"

    assert_text "Perros en adopcion was successfully created"
    click_on "Back"
  end

  test "should update Perros en adopcion" do
    visit perros_en_adopcion_url(@perros_en_adopcion)
    click_on "Edit this perros en adopcion", match: :first

    fill_in "Edad", with: @perros_en_adopcion.edad
    fill_in "Fecha de publicacion", with: @perros_en_adopcion.fecha_de_publicacion
    fill_in "Foto", with: @perros_en_adopcion.foto
    fill_in "Nombre", with: @perros_en_adopcion.nombre
    fill_in "Raza", with: @perros_en_adopcion.raza
    fill_in "Sexo", with: @perros_en_adopcion.sexo
    check "Status" if @perros_en_adopcion.status
    fill_in "Tamano", with: @perros_en_adopcion.tamano
    click_on "Update Perros en adopcion"

    assert_text "Perros en adopcion was successfully updated"
    click_on "Back"
  end

  test "should destroy Perros en adopcion" do
    visit perros_en_adopcion_url(@perros_en_adopcion)
    click_on "Destroy this perros en adopcion", match: :first

    assert_text "Perros en adopcion was successfully destroyed"
  end
end
