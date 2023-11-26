require "test_helper"

class HistoriaCsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @historia_c = historia_cs(:one)
  end

  test "should get index" do
    get historia_cs_url
    assert_response :success
  end

  test "should get new" do
    get new_historia_c_url
    assert_response :success
  end

  test "should create historia_c" do
    assert_difference("HistoriaC.count") do
      post historia_cs_url, params: { historia_c: { año: @historia_c.año, detalle: @historia_c.detalle, dia: @historia_c.dia, diagnostico: @historia_c.diagnostico, dosis: @historia_c.dosis, lote: @historia_c.lote, mes: @historia_c.mes, perrito_id: @historia_c.perrito_id, producto: @historia_c.producto, sintomas: @historia_c.sintomas, tipo: @historia_c.tipo, tipoVacuna: @historia_c.tipoVacuna, tratamiento: @historia_c.tratamiento } }
    end

    assert_redirected_to historia_c_url(HistoriaC.last)
  end

  test "should show historia_c" do
    get historia_c_url(@historia_c)
    assert_response :success
  end

  test "should get edit" do
    get edit_historia_c_url(@historia_c)
    assert_response :success
  end

  test "should update historia_c" do
    patch historia_c_url(@historia_c), params: { historia_c: { año: @historia_c.año, detalle: @historia_c.detalle, dia: @historia_c.dia, diagnostico: @historia_c.diagnostico, dosis: @historia_c.dosis, lote: @historia_c.lote, mes: @historia_c.mes, perrito_id: @historia_c.perrito_id, producto: @historia_c.producto, sintomas: @historia_c.sintomas, tipo: @historia_c.tipo, tipoVacuna: @historia_c.tipoVacuna, tratamiento: @historia_c.tratamiento } }
    assert_redirected_to historia_c_url(@historia_c)
  end

  test "should destroy historia_c" do
    assert_difference("HistoriaC.count", -1) do
      delete historia_c_url(@historia_c)
    end

    assert_redirected_to historia_cs_url
  end
end
