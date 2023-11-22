require "application_system_test_case"

class DesparasitacionsTest < ApplicationSystemTestCase
  setup do
    @desparasitacion = desparasitacions(:one)
  end

  test "visiting the index" do
    visit desparasitacions_url
    assert_selector "h1", text: "Desparasitacions"
  end

  test "should create desparasitacion" do
    visit desparasitacions_url
    click_on "New desparasitacion"

    fill_in "Anio", with: @desparasitacion.anio
    fill_in "Detalle", with: @desparasitacion.detalle
    fill_in "Dia", with: @desparasitacion.dia
    fill_in "Dosis", with: @desparasitacion.dosis
    fill_in "Historia c", with: @desparasitacion.historia_c_id
    fill_in "Lote", with: @desparasitacion.lote
    fill_in "Mes", with: @desparasitacion.mes
    fill_in "Producto", with: @desparasitacion.producto
    click_on "Create Desparasitacion"

    assert_text "Desparasitacion was successfully created"
    click_on "Back"
  end

  test "should update Desparasitacion" do
    visit desparasitacion_url(@desparasitacion)
    click_on "Edit this desparasitacion", match: :first

    fill_in "Anio", with: @desparasitacion.anio
    fill_in "Detalle", with: @desparasitacion.detalle
    fill_in "Dia", with: @desparasitacion.dia
    fill_in "Dosis", with: @desparasitacion.dosis
    fill_in "Historia c", with: @desparasitacion.historia_c_id
    fill_in "Lote", with: @desparasitacion.lote
    fill_in "Mes", with: @desparasitacion.mes
    fill_in "Producto", with: @desparasitacion.producto
    click_on "Update Desparasitacion"

    assert_text "Desparasitacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Desparasitacion" do
    visit desparasitacion_url(@desparasitacion)
    click_on "Destroy this desparasitacion", match: :first

    assert_text "Desparasitacion was successfully destroyed"
  end
end
