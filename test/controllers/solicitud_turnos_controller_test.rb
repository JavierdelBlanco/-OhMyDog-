require "test_helper"

class SolicitudTurnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitud_turno = solicitud_turnos(:one)
  end

  test "should get index" do
    get solicitud_turnos_url
    assert_response :success
  end

  test "should get new" do
    get new_solicitud_turno_url
    assert_response :success
  end

  test "should create solicitud_turno" do
    assert_difference("SolicitudTurno.count") do
      post solicitud_turnos_url, params: { solicitud_turno: { apellido_cliente: @solicitud_turno.apellido_cliente, descripcion: @solicitud_turno.descripcion, dia: @solicitud_turno.dia, horario: @solicitud_turno.horario, nombre_cliente: @solicitud_turno.nombre_cliente, nombres_perros: @solicitud_turno.nombres_perros, tipo_turno: @solicitud_turno.tipo_turno } }
    end

    assert_redirected_to solicitud_turno_url(SolicitudTurno.last)
  end

  test "should show solicitud_turno" do
    get solicitud_turno_url(@solicitud_turno)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicitud_turno_url(@solicitud_turno)
    assert_response :success
  end

  test "should update solicitud_turno" do
    patch solicitud_turno_url(@solicitud_turno), params: { solicitud_turno: { apellido_cliente: @solicitud_turno.apellido_cliente, descripcion: @solicitud_turno.descripcion, dia: @solicitud_turno.dia, horario: @solicitud_turno.horario, nombre_cliente: @solicitud_turno.nombre_cliente, nombres_perros: @solicitud_turno.nombres_perros, tipo_turno: @solicitud_turno.tipo_turno } }
    assert_redirected_to solicitud_turno_url(@solicitud_turno)
  end

  test "should destroy solicitud_turno" do
    assert_difference("SolicitudTurno.count", -1) do
      delete solicitud_turno_url(@solicitud_turno)
    end

    assert_redirected_to solicitud_turnos_url
  end
end
