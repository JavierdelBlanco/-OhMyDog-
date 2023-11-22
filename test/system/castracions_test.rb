require "application_system_test_case"

class CastracionsTest < ApplicationSystemTestCase
  setup do
    @castracion = castracions(:one)
  end

  test "visiting the index" do
    visit castracions_url
    assert_selector "h1", text: "Castracions"
  end

  test "should create castracion" do
    visit castracions_url
    click_on "New castracion"

    fill_in "Anio", with: @castracion.anio
    fill_in "Detalle", with: @castracion.detalle
    fill_in "Dia", with: @castracion.dia
    fill_in "Historia c", with: @castracion.historia_c_id
    fill_in "Mes", with: @castracion.mes
    click_on "Create Castracion"

    assert_text "Castracion was successfully created"
    click_on "Back"
  end

  test "should update Castracion" do
    visit castracion_url(@castracion)
    click_on "Edit this castracion", match: :first

    fill_in "Anio", with: @castracion.anio
    fill_in "Detalle", with: @castracion.detalle
    fill_in "Dia", with: @castracion.dia
    fill_in "Historia c", with: @castracion.historia_c_id
    fill_in "Mes", with: @castracion.mes
    click_on "Update Castracion"

    assert_text "Castracion was successfully updated"
    click_on "Back"
  end

  test "should destroy Castracion" do
    visit castracion_url(@castracion)
    click_on "Destroy this castracion", match: :first

    assert_text "Castracion was successfully destroyed"
  end
end
