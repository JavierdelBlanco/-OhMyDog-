require "test_helper"

class CastracionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @castracion = castracions(:one)
  end

  test "should get index" do
    get castracions_url
    assert_response :success
  end

  test "should get new" do
    get new_castracion_url
    assert_response :success
  end

  test "should create castracion" do
    assert_difference("Castracion.count") do
      post castracions_url, params: { castracion: { anio: @castracion.anio, detalle: @castracion.detalle, dia: @castracion.dia, historia_c_id: @castracion.historia_c_id, mes: @castracion.mes } }
    end

    assert_redirected_to castracion_url(Castracion.last)
  end

  test "should show castracion" do
    get castracion_url(@castracion)
    assert_response :success
  end

  test "should get edit" do
    get edit_castracion_url(@castracion)
    assert_response :success
  end

  test "should update castracion" do
    patch castracion_url(@castracion), params: { castracion: { anio: @castracion.anio, detalle: @castracion.detalle, dia: @castracion.dia, historia_c_id: @castracion.historia_c_id, mes: @castracion.mes } }
    assert_redirected_to castracion_url(@castracion)
  end

  test "should destroy castracion" do
    assert_difference("Castracion.count", -1) do
      delete castracion_url(@castracion)
    end

    assert_redirected_to castracions_url
  end
end
