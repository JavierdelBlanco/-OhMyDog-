require "application_system_test_case"

class TurnosTest < ApplicationSystemTestCase
  setup do
    @turno = turnos(:one)
  end

  test "visiting the index" do
    visit turnos_url
    assert_selector "h1", text: "Turnos"
  end

  test "should create turno" do
    visit turnos_url
    click_on "New turno"

    fill_in "Apellido cliente", with: @turno.apellido_cliente
    fill_in "Descripcion", with: @turno.descripcion
    fill_in "Dia", with: @turno.dia
    fill_in "Horario", with: @turno.horario
    fill_in "Nombre cliente", with: @turno.nombre_cliente
    fill_in "Nombres perros", with: @turno.nombres_perros
    fill_in "Tipo turno", with: @turno.tipo_turno
    click_on "Create Turno"

    assert_text "Turno was successfully created"
    click_on "Back"
  end

  test "should update Turno" do
    visit turno_url(@turno)
    click_on "Edit this turno", match: :first

    fill_in "Apellido cliente", with: @turno.apellido_cliente
    fill_in "Descripcion", with: @turno.descripcion
    fill_in "Dia", with: @turno.dia
    fill_in "Horario", with: @turno.horario
    fill_in "Nombre cliente", with: @turno.nombre_cliente
    fill_in "Nombres perros", with: @turno.nombres_perros
    fill_in "Tipo turno", with: @turno.tipo_turno
    click_on "Update Turno"

    assert_text "Turno was successfully updated"
    click_on "Back"
  end

  test "should destroy Turno" do
    visit turno_url(@turno)
    click_on "Destroy this turno", match: :first

    assert_text "Turno was successfully destroyed"
  end
end
