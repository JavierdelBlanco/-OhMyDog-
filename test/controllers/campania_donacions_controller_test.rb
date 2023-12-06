require "test_helper"

class CampaniaDonacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campania_donacion = campania_donacions(:one)
  end

  test "should get index" do
    get campania_donacions_url
    assert_response :success
  end

  test "should get new" do
    get new_campania_donacion_url
    assert_response :success
  end

  test "should create campania_donacion" do
    assert_difference("CampaniaDonacion.count") do
      post campania_donacions_url, params: { campania_donacion: { anio_limite: @campania_donacion.anio_limite, beneficiario: @campania_donacion.beneficiario, dia_limite: @campania_donacion.dia_limite, imagen: @campania_donacion.imagen, mes_limite: @campania_donacion.mes_limite, monto_actual: @campania_donacion.monto_actual, monto_total: @campania_donacion.monto_total, motivo: @campania_donacion.motivo, nombre: @campania_donacion.nombre } }
    end

    assert_redirected_to campania_donacion_url(CampaniaDonacion.last)
  end

  test "should show campania_donacion" do
    get campania_donacion_url(@campania_donacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_campania_donacion_url(@campania_donacion)
    assert_response :success
  end

  test "should update campania_donacion" do
    patch campania_donacion_url(@campania_donacion), params: { campania_donacion: { anio_limite: @campania_donacion.anio_limite, beneficiario: @campania_donacion.beneficiario, dia_limite: @campania_donacion.dia_limite, imagen: @campania_donacion.imagen, mes_limite: @campania_donacion.mes_limite, monto_actual: @campania_donacion.monto_actual, monto_total: @campania_donacion.monto_total, motivo: @campania_donacion.motivo, nombre: @campania_donacion.nombre } }
    assert_redirected_to campania_donacion_url(@campania_donacion)
  end

  test "should destroy campania_donacion" do
    assert_difference("CampaniaDonacion.count", -1) do
      delete campania_donacion_url(@campania_donacion)
    end

    assert_redirected_to campania_donacions_url
  end
end
