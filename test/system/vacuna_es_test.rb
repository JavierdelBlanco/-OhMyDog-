require "application_system_test_case"

class VacunaEsTest < ApplicationSystemTestCase
  setup do
    @vacuna_e = vacuna_es(:one)
  end

  test "visiting the index" do
    visit vacuna_es_url
    assert_selector "h1", text: "Vacuna es"
  end

  test "should create vacuna e" do
    visit vacuna_es_url
    click_on "New vacuna e"

    fill_in "Anio", with: @vacuna_e.anio
    fill_in "Detalle", with: @vacuna_e.detalle
    fill_in "Dia", with: @vacuna_e.dia
    fill_in "Dosis", with: @vacuna_e.dosis
    fill_in "Historia c", with: @vacuna_e.historia_c_id
    fill_in "Lote", with: @vacuna_e.lote
    fill_in "Marca", with: @vacuna_e.marca
    fill_in "Mes", with: @vacuna_e.mes
    fill_in "Tipo", with: @vacuna_e.tipo
    click_on "Create Vacuna e"

    assert_text "Vacuna e was successfully created"
    click_on "Back"
  end

  test "should update Vacuna e" do
    visit vacuna_e_url(@vacuna_e)
    click_on "Edit this vacuna e", match: :first

    fill_in "Anio", with: @vacuna_e.anio
    fill_in "Detalle", with: @vacuna_e.detalle
    fill_in "Dia", with: @vacuna_e.dia
    fill_in "Dosis", with: @vacuna_e.dosis
    fill_in "Historia c", with: @vacuna_e.historia_c_id
    fill_in "Lote", with: @vacuna_e.lote
    fill_in "Marca", with: @vacuna_e.marca
    fill_in "Mes", with: @vacuna_e.mes
    fill_in "Tipo", with: @vacuna_e.tipo
    click_on "Update Vacuna e"

    assert_text "Vacuna e was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacuna e" do
    visit vacuna_e_url(@vacuna_e)
    click_on "Destroy this vacuna e", match: :first

    assert_text "Vacuna e was successfully destroyed"
  end
end
