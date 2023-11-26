require "application_system_test_case"

class SolicitudTurnosTest < ApplicationSystemTestCase
  setup do
    @solicitud_turno = solicitud_turnos(:one)
  end

  test "visiting the index" do
    visit solicitud_turnos_url
    assert_selector "h1", text: "Solicitud turnos"
  end

  test "should create solicitud turno" do
    visit solicitud_turnos_url
    click_on "New solicitud turno"

    fill_in "Apellido cliente", with: @solicitud_turno.apellido_cliente
    fill_in "Descripcion", with: @solicitud_turno.descripcion
    fill_in "Dia", with: @solicitud_turno.dia
    fill_in "Horario", with: @solicitud_turno.horario
    fill_in "Nombre cliente", with: @solicitud_turno.nombre_cliente
    fill_in "Nombres perros", with: @solicitud_turno.nombres_perros
    fill_in "Tipo turno", with: @solicitud_turno.tipo_turno
    click_on "Create Solicitud turno"

    assert_text "Solicitud turno was successfully created"
    click_on "Back"
  end

  test "should update Solicitud turno" do
    visit solicitud_turno_url(@solicitud_turno)
    click_on "Edit this solicitud turno", match: :first

    fill_in "Apellido cliente", with: @solicitud_turno.apellido_cliente
    fill_in "Descripcion", with: @solicitud_turno.descripcion
    fill_in "Dia", with: @solicitud_turno.dia
    fill_in "Horario", with: @solicitud_turno.horario
    fill_in "Nombre cliente", with: @solicitud_turno.nombre_cliente
    fill_in "Nombres perros", with: @solicitud_turno.nombres_perros
    fill_in "Tipo turno", with: @solicitud_turno.tipo_turno
    click_on "Update Solicitud turno"

    assert_text "Solicitud turno was successfully updated"
    click_on "Back"
  end

  test "should destroy Solicitud turno" do
    visit solicitud_turno_url(@solicitud_turno)
    click_on "Destroy this solicitud turno", match: :first

    assert_text "Solicitud turno was successfully destroyed"
  end
end
