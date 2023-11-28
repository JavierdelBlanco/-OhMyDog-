require "application_system_test_case"

class SolicitudTurnosTest < ApplicationSystemTestCase
  setup do
    @turno = turnos(:one)
  end

  test "visiting the index" do
    visit turnos_url
    assert_selector "h1", text: "Solicitud turnos"
  end

  test "should create solicitud turno" do
    visit turnos_url
    click_on "New solicitud turno"

    fill_in "Apellido cliente", with: @turno.apellido_cliente
    fill_in "Descripcion", with: @turno.descripcion
    fill_in "Dia", with: @turno.dia
    fill_in "Horario", with: @turno.horario
    fill_in "Nombre cliente", with: @turno.nombre_cliente
    fill_in "Nombres perros", with: @turno.nombres_perros
    fill_in "Tipo turno", with: @turno.tipo_turno
    click_on "Create Solicitud turno"

    assert_text "Solicitud turno was successfully created"
    click_on "Back"
  end

  test "should update Solicitud turno" do
    visit turno_url(@turno)
    click_on "Edit this solicitud turno", match: :first

    fill_in "Apellido cliente", with: @turno.apellido_cliente
    fill_in "Descripcion", with: @turno.descripcion
    fill_in "Dia", with: @turno.dia
    fill_in "Horario", with: @turno.horario
    fill_in "Nombre cliente", with: @turno.nombre_cliente
    fill_in "Nombres perros", with: @turno.nombres_perros
    fill_in "Tipo turno", with: @turno.tipo_turno
    click_on "Update Solicitud turno"

    assert_text "Solicitud turno was successfully updated"
    click_on "Back"
  end

  test "should destroy Solicitud turno" do
    visit turno_url(@turno)
    click_on "Destroy this solicitud turno", match: :first

    assert_text "Solicitud turno was successfully destroyed"
  end
end
