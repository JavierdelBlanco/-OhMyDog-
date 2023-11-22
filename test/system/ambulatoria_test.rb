require "application_system_test_case"

class AmbulatoriaTest < ApplicationSystemTestCase
  setup do
    @ambulatorium = ambulatoria(:one)
  end

  test "visiting the index" do
    visit ambulatoria_url
    assert_selector "h1", text: "Ambulatoria"
  end

  test "should create ambulatorium" do
    visit ambulatoria_url
    click_on "New ambulatorium"

    fill_in "Anio", with: @ambulatorium.anio
    fill_in "Detalles", with: @ambulatorium.detalles
    fill_in "Dia", with: @ambulatorium.dia
    fill_in "Diagnostico", with: @ambulatorium.diagnostico
    fill_in "Historia c", with: @ambulatorium.historia_c_id
    fill_in "Mes", with: @ambulatorium.mes
    fill_in "Sintomas", with: @ambulatorium.sintomas
    fill_in "Tratamiento", with: @ambulatorium.tratamiento
    click_on "Create Ambulatorium"

    assert_text "Ambulatorium was successfully created"
    click_on "Back"
  end

  test "should update Ambulatorium" do
    visit ambulatorium_url(@ambulatorium)
    click_on "Edit this ambulatorium", match: :first

    fill_in "Anio", with: @ambulatorium.anio
    fill_in "Detalles", with: @ambulatorium.detalles
    fill_in "Dia", with: @ambulatorium.dia
    fill_in "Diagnostico", with: @ambulatorium.diagnostico
    fill_in "Historia c", with: @ambulatorium.historia_c_id
    fill_in "Mes", with: @ambulatorium.mes
    fill_in "Sintomas", with: @ambulatorium.sintomas
    fill_in "Tratamiento", with: @ambulatorium.tratamiento
    click_on "Update Ambulatorium"

    assert_text "Ambulatorium was successfully updated"
    click_on "Back"
  end

  test "should destroy Ambulatorium" do
    visit ambulatorium_url(@ambulatorium)
    click_on "Destroy this ambulatorium", match: :first

    assert_text "Ambulatorium was successfully destroyed"
  end
end
