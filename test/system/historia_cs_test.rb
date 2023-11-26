require "application_system_test_case"

class HistoriaCsTest < ApplicationSystemTestCase
  setup do
    @historia_c = historia_cs(:one)
  end

  test "visiting the index" do
    visit historia_cs_url
    assert_selector "h1", text: "Historia cs"
  end

  test "should create historia c" do
    visit historia_cs_url
    click_on "New historia c"

    fill_in "Año", with: @historia_c.año
    fill_in "Detalle", with: @historia_c.detalle
    fill_in "Dia", with: @historia_c.dia
    fill_in "Diagnostico", with: @historia_c.diagnostico
    fill_in "Dosis", with: @historia_c.dosis
    fill_in "Lote", with: @historia_c.lote
    fill_in "Mes", with: @historia_c.mes
    fill_in "Perrito", with: @historia_c.perrito_id
    fill_in "Producto", with: @historia_c.producto
    fill_in "Sintomas", with: @historia_c.sintomas
    fill_in "Tipo", with: @historia_c.tipo
    fill_in "Tipovacuna", with: @historia_c.tipoVacuna
    fill_in "Tratamiento", with: @historia_c.tratamiento
    click_on "Create Historia c"

    assert_text "Historia c was successfully created"
    click_on "Back"
  end

  test "should update Historia c" do
    visit historia_c_url(@historia_c)
    click_on "Edit this historia c", match: :first

    fill_in "Año", with: @historia_c.año
    fill_in "Detalle", with: @historia_c.detalle
    fill_in "Dia", with: @historia_c.dia
    fill_in "Diagnostico", with: @historia_c.diagnostico
    fill_in "Dosis", with: @historia_c.dosis
    fill_in "Lote", with: @historia_c.lote
    fill_in "Mes", with: @historia_c.mes
    fill_in "Perrito", with: @historia_c.perrito_id
    fill_in "Producto", with: @historia_c.producto
    fill_in "Sintomas", with: @historia_c.sintomas
    fill_in "Tipo", with: @historia_c.tipo
    fill_in "Tipovacuna", with: @historia_c.tipoVacuna
    fill_in "Tratamiento", with: @historia_c.tratamiento
    click_on "Update Historia c"

    assert_text "Historia c was successfully updated"
    click_on "Back"
  end

  test "should destroy Historia c" do
    visit historia_c_url(@historia_c)
    click_on "Destroy this historia c", match: :first

    assert_text "Historia c was successfully destroyed"
  end
end
