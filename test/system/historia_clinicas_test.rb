require "application_system_test_case"

class HistoriaClinicasTest < ApplicationSystemTestCase
  setup do
    @historia_clinica = historia_clinicas(:one)
  end

  test "visiting the index" do
    visit historia_clinicas_url
    assert_selector "h1", text: "Historia clinicas"
  end

  test "should create historia clinica" do
    visit historia_clinicas_url
    click_on "New historia clinica"

    fill_in "Año", with: @historia_clinica.año
    fill_in "Detalle", with: @historia_clinica.detalle
    fill_in "Dia", with: @historia_clinica.dia
    fill_in "Diagnostico", with: @historia_clinica.diagnostico
    fill_in "Dosis", with: @historia_clinica.dosis
    fill_in "Lote", with: @historia_clinica.lote
    fill_in "Mes", with: @historia_clinica.mes
    fill_in "Perrito", with: @historia_clinica.perrito_id
    fill_in "Producto", with: @historia_clinica.producto
    fill_in "Sintomas", with: @historia_clinica.sintomas
    fill_in "Tipo", with: @historia_clinica.tipo
    fill_in "Tipovacuna", with: @historia_clinica.tipoVacuna
    fill_in "Tratamiento", with: @historia_clinica.tratamiento
    click_on "Create Historia clinica"

    assert_text "Historia clinica was successfully created"
    click_on "Back"
  end

  test "should update Historia clinica" do
    visit historia_clinica_url(@historia_clinica)
    click_on "Edit this historia clinica", match: :first

    fill_in "Año", with: @historia_clinica.año
    fill_in "Detalle", with: @historia_clinica.detalle
    fill_in "Dia", with: @historia_clinica.dia
    fill_in "Diagnostico", with: @historia_clinica.diagnostico
    fill_in "Dosis", with: @historia_clinica.dosis
    fill_in "Lote", with: @historia_clinica.lote
    fill_in "Mes", with: @historia_clinica.mes
    fill_in "Perrito", with: @historia_clinica.perrito_id
    fill_in "Producto", with: @historia_clinica.producto
    fill_in "Sintomas", with: @historia_clinica.sintomas
    fill_in "Tipo", with: @historia_clinica.tipo
    fill_in "Tipovacuna", with: @historia_clinica.tipoVacuna
    fill_in "Tratamiento", with: @historia_clinica.tratamiento
    click_on "Update Historia clinica"

    assert_text "Historia clinica was successfully updated"
    click_on "Back"
  end

  test "should destroy Historia clinica" do
    visit historia_clinica_url(@historia_clinica)
    click_on "Destroy this historia clinica", match: :first

    assert_text "Historia clinica was successfully destroyed"
  end
end
