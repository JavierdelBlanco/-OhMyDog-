require "application_system_test_case"

class VacunaRsTest < ApplicationSystemTestCase
  setup do
    @vacuna_r = vacuna_rs(:one)
  end

  test "visiting the index" do
    visit vacuna_rs_url
    assert_selector "h1", text: "Vacuna rs"
  end

  test "should create vacuna r" do
    visit vacuna_rs_url
    click_on "New vacuna r"

    fill_in "Anio", with: @vacuna_r.anio
    fill_in "Detalle", with: @vacuna_r.detalle
    fill_in "Dia", with: @vacuna_r.dia
    fill_in "Dosis", with: @vacuna_r.dosis
    fill_in "Historia c", with: @vacuna_r.historia_c_id
    fill_in "Lote", with: @vacuna_r.lote
    fill_in "Marca", with: @vacuna_r.marca
    fill_in "Mes", with: @vacuna_r.mes
    fill_in "Tipo", with: @vacuna_r.tipo
    click_on "Create Vacuna r"

    assert_text "Vacuna r was successfully created"
    click_on "Back"
  end

  test "should update Vacuna r" do
    visit vacuna_r_url(@vacuna_r)
    click_on "Edit this vacuna r", match: :first

    fill_in "Anio", with: @vacuna_r.anio
    fill_in "Detalle", with: @vacuna_r.detalle
    fill_in "Dia", with: @vacuna_r.dia
    fill_in "Dosis", with: @vacuna_r.dosis
    fill_in "Historia c", with: @vacuna_r.historia_c_id
    fill_in "Lote", with: @vacuna_r.lote
    fill_in "Marca", with: @vacuna_r.marca
    fill_in "Mes", with: @vacuna_r.mes
    fill_in "Tipo", with: @vacuna_r.tipo
    click_on "Update Vacuna r"

    assert_text "Vacuna r was successfully updated"
    click_on "Back"
  end

  test "should destroy Vacuna r" do
    visit vacuna_r_url(@vacuna_r)
    click_on "Destroy this vacuna r", match: :first

    assert_text "Vacuna r was successfully destroyed"
  end
end
