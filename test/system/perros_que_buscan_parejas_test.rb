require "application_system_test_case"

class PerrosQueBuscanParejasTest < ApplicationSystemTestCase
  setup do
    @perros_que_buscan_pareja = perros_que_buscan_parejas(:one)
  end

  test "visiting the index" do
    visit perros_que_buscan_parejas_url
    assert_selector "h1", text: "Perros que buscan parejas"
  end

  test "should create perros que buscan pareja" do
    visit perros_que_buscan_parejas_url
    click_on "New perros que buscan pareja"

    fill_in "Caracteristicas", with: @perros_que_buscan_pareja.caracteristicas
    fill_in "Color", with: @perros_que_buscan_pareja.color
    fill_in "Condiciones", with: @perros_que_buscan_pareja.condiciones
    fill_in "Fecha de nacimiento", with: @perros_que_buscan_pareja.fecha_de_nacimiento
    fill_in "Nombre", with: @perros_que_buscan_pareja.nombre
    fill_in "Raza", with: @perros_que_buscan_pareja.raza
    fill_in "Sexo", with: @perros_que_buscan_pareja.sexo
    fill_in "Tamano", with: @perros_que_buscan_pareja.tamano
    click_on "Create Perros que buscan pareja"

    assert_text "Perros que buscan pareja was successfully created"
    click_on "Back"
  end

  test "should update Perros que buscan pareja" do
    visit perros_que_buscan_pareja_url(@perros_que_buscan_pareja)
    click_on "Edit this perros que buscan pareja", match: :first

    fill_in "Caracteristicas", with: @perros_que_buscan_pareja.caracteristicas
    fill_in "Color", with: @perros_que_buscan_pareja.color
    fill_in "Condiciones", with: @perros_que_buscan_pareja.condiciones
    fill_in "Fecha de nacimiento", with: @perros_que_buscan_pareja.fecha_de_nacimiento
    fill_in "Nombre", with: @perros_que_buscan_pareja.nombre
    fill_in "Raza", with: @perros_que_buscan_pareja.raza
    fill_in "Sexo", with: @perros_que_buscan_pareja.sexo
    fill_in "Tamano", with: @perros_que_buscan_pareja.tamano
    click_on "Update Perros que buscan pareja"

    assert_text "Perros que buscan pareja was successfully updated"
    click_on "Back"
  end

  test "should destroy Perros que buscan pareja" do
    visit perros_que_buscan_pareja_url(@perros_que_buscan_pareja)
    click_on "Destroy this perros que buscan pareja", match: :first

    assert_text "Perros que buscan pareja was successfully destroyed"
  end
end
