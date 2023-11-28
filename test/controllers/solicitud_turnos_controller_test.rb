require "test_helper"

class SolicitudTurnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turno = turnos(:one)
  end

  test "should get index" do
    get turnos_url
    assert_response :success
  end

  test "should get new" do
    get new_turno_url
    assert_response :success
  end

  test "should create turno" do
    assert_difference("SolicitudTurno.count") do
      post turnos_url, params: { turno: { apellido_cliente: @turno.apellido_cliente, descripcion: @turno.descripcion, dia: @turno.dia, horario: @turno.horario, nombre_cliente: @turno.nombre_cliente, nombres_perros: @turno.nombres_perros, tipo_turno: @turno.tipo_turno } }
    end

    assert_redirected_to turno_url(SolicitudTurno.last)
  end

  test "should show turno" do
    get turno_url(@turno)
    assert_response :success
  end

  test "should get edit" do
    get edit_turno_url(@turno)
    assert_response :success
  end

  test "should update turno" do
    patch turno_url(@turno), params: { turno: { apellido_cliente: @turno.apellido_cliente, descripcion: @turno.descripcion, dia: @turno.dia, horario: @turno.horario, nombre_cliente: @turno.nombre_cliente, nombres_perros: @turno.nombres_perros, tipo_turno: @turno.tipo_turno } }
    assert_redirected_to turno_url(@turno)
  end

  test "should destroy turno" do
    assert_difference("SolicitudTurno.count", -1) do
      delete turno_url(@turno)
    end

    assert_redirected_to turnos_url
  end
end
