require "test_helper"

class VacunaEsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vacuna_e = vacuna_es(:one)
  end

  test "should get index" do
    get vacuna_es_url
    assert_response :success
  end

  test "should get new" do
    get new_vacuna_e_url
    assert_response :success
  end

  test "should create vacuna_e" do
    assert_difference("VacunaE.count") do
      post vacuna_es_url, params: { vacuna_e: { anio: @vacuna_e.anio, detalle: @vacuna_e.detalle, dia: @vacuna_e.dia, dosis: @vacuna_e.dosis, historia_c_id: @vacuna_e.historia_c_id, lote: @vacuna_e.lote, marca: @vacuna_e.marca, mes: @vacuna_e.mes, tipo: @vacuna_e.tipo } }
    end

    assert_redirected_to vacuna_e_url(VacunaE.last)
  end

  test "should show vacuna_e" do
    get vacuna_e_url(@vacuna_e)
    assert_response :success
  end

  test "should get edit" do
    get edit_vacuna_e_url(@vacuna_e)
    assert_response :success
  end

  test "should update vacuna_e" do
    patch vacuna_e_url(@vacuna_e), params: { vacuna_e: { anio: @vacuna_e.anio, detalle: @vacuna_e.detalle, dia: @vacuna_e.dia, dosis: @vacuna_e.dosis, historia_c_id: @vacuna_e.historia_c_id, lote: @vacuna_e.lote, marca: @vacuna_e.marca, mes: @vacuna_e.mes, tipo: @vacuna_e.tipo } }
    assert_redirected_to vacuna_e_url(@vacuna_e)
  end

  test "should destroy vacuna_e" do
    assert_difference("VacunaE.count", -1) do
      delete vacuna_e_url(@vacuna_e)
    end

    assert_redirected_to vacuna_es_url
  end
end
