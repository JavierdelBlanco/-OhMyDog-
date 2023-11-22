require "test_helper"

class AmbulatoriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ambulatorium = ambulatoria(:one)
  end

  test "should get index" do
    get ambulatoria_url
    assert_response :success
  end

  test "should get new" do
    get new_ambulatorium_url
    assert_response :success
  end

  test "should create ambulatorium" do
    assert_difference("Ambulatorium.count") do
      post ambulatoria_url, params: { ambulatorium: { anio: @ambulatorium.anio, detalles: @ambulatorium.detalles, dia: @ambulatorium.dia, diagnostico: @ambulatorium.diagnostico, historia_c_id: @ambulatorium.historia_c_id, mes: @ambulatorium.mes, sintomas: @ambulatorium.sintomas, tratamiento: @ambulatorium.tratamiento } }
    end

    assert_redirected_to ambulatorium_url(Ambulatorium.last)
  end

  test "should show ambulatorium" do
    get ambulatorium_url(@ambulatorium)
    assert_response :success
  end

  test "should get edit" do
    get edit_ambulatorium_url(@ambulatorium)
    assert_response :success
  end

  test "should update ambulatorium" do
    patch ambulatorium_url(@ambulatorium), params: { ambulatorium: { anio: @ambulatorium.anio, detalles: @ambulatorium.detalles, dia: @ambulatorium.dia, diagnostico: @ambulatorium.diagnostico, historia_c_id: @ambulatorium.historia_c_id, mes: @ambulatorium.mes, sintomas: @ambulatorium.sintomas, tratamiento: @ambulatorium.tratamiento } }
    assert_redirected_to ambulatorium_url(@ambulatorium)
  end

  test "should destroy ambulatorium" do
    assert_difference("Ambulatorium.count", -1) do
      delete ambulatorium_url(@ambulatorium)
    end

    assert_redirected_to ambulatoria_url
  end
end
