require "test_helper"

class VacunaRsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacuna_r = vacuna_rs(:one)
  end

  test "should get index" do
    get vacuna_rs_url
    assert_response :success
  end

  test "should get new" do
    get new_vacuna_r_url
    assert_response :success
  end

  test "should create vacuna_r" do
    assert_difference("VacunaR.count") do
      post vacuna_rs_url, params: { vacuna_r: { anio: @vacuna_r.anio, detalle: @vacuna_r.detalle, dia: @vacuna_r.dia, dosis: @vacuna_r.dosis, historia_c_id: @vacuna_r.historia_c_id, lote: @vacuna_r.lote, marca: @vacuna_r.marca, mes: @vacuna_r.mes, tipo: @vacuna_r.tipo } }
    end

    assert_redirected_to vacuna_r_url(VacunaR.last)
  end

  test "should show vacuna_r" do
    get vacuna_r_url(@vacuna_r)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacuna_r_url(@vacuna_r)
    assert_response :success
  end

  test "should update vacuna_r" do
    patch vacuna_r_url(@vacuna_r), params: { vacuna_r: { anio: @vacuna_r.anio, detalle: @vacuna_r.detalle, dia: @vacuna_r.dia, dosis: @vacuna_r.dosis, historia_c_id: @vacuna_r.historia_c_id, lote: @vacuna_r.lote, marca: @vacuna_r.marca, mes: @vacuna_r.mes, tipo: @vacuna_r.tipo } }
    assert_redirected_to vacuna_r_url(@vacuna_r)
  end

  test "should destroy vacuna_r" do
    assert_difference("VacunaR.count", -1) do
      delete vacuna_r_url(@vacuna_r)
    end

    assert_redirected_to vacuna_rs_url
  end
end
