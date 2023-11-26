require "test_helper"

class HistoriaClinicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historia_clinica = historia_clinicas(:one)
  end

  test "should get index" do
    get historia_clinicas_url
    assert_response :success
  end

  test "should get new" do
    get new_historia_clinica_url
    assert_response :success
  end

  test "should create historia_clinica" do
    assert_difference("HistoriaClinica.count") do
      post historia_clinicas_url, params: { historia_clinica: { año: @historia_clinica.año, detalle: @historia_clinica.detalle, dia: @historia_clinica.dia, diagnostico: @historia_clinica.diagnostico, dosis: @historia_clinica.dosis, lote: @historia_clinica.lote, mes: @historia_clinica.mes, perrito_id: @historia_clinica.perrito_id, producto: @historia_clinica.producto, sintomas: @historia_clinica.sintomas, tipo: @historia_clinica.tipo, tipoVacuna: @historia_clinica.tipoVacuna, tratamiento: @historia_clinica.tratamiento } }
    end

    assert_redirected_to historia_clinica_url(HistoriaClinica.last)
  end

  test "should show historia_clinica" do
    get historia_clinica_url(@historia_clinica)
    assert_response :success
  end

  test "should get edit" do
    get edit_historia_clinica_url(@historia_clinica)
    assert_response :success
  end

  test "should update historia_clinica" do
    patch historia_clinica_url(@historia_clinica), params: { historia_clinica: { año: @historia_clinica.año, detalle: @historia_clinica.detalle, dia: @historia_clinica.dia, diagnostico: @historia_clinica.diagnostico, dosis: @historia_clinica.dosis, lote: @historia_clinica.lote, mes: @historia_clinica.mes, perrito_id: @historia_clinica.perrito_id, producto: @historia_clinica.producto, sintomas: @historia_clinica.sintomas, tipo: @historia_clinica.tipo, tipoVacuna: @historia_clinica.tipoVacuna, tratamiento: @historia_clinica.tratamiento } }
    assert_redirected_to historia_clinica_url(@historia_clinica)
  end

  test "should destroy historia_clinica" do
    assert_difference("HistoriaClinica.count", -1) do
      delete historia_clinica_url(@historia_clinica)
    end

    assert_redirected_to historia_clinicas_url
  end
end
