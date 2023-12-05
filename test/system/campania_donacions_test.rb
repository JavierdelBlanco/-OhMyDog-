require "application_system_test_case"

class CampaniaDonacionsTest < ApplicationSystemTestCase
  setup do
    @campania_donacion = campania_donacions(:one)
  end

  test "visiting the index" do
    visit campania_donacions_url
    assert_selector "h1", text: "Campania donacions"
  end

  test "should create campania donacion" do
    visit campania_donacions_url
    click_on "New campania donacion"

    fill_in "Anio limite", with: @campania_donacion.anio_limite
    fill_in "Beneficiario", with: @campania_donacion.beneficiario
    fill_in "Dia limite", with: @campania_donacion.dia_limite
    fill_in "Imagen", with: @campania_donacion.imagen
    fill_in "Mes limite", with: @campania_donacion.mes_limite
    fill_in "Monto actual", with: @campania_donacion.monto_actual
    fill_in "Monto total", with: @campania_donacion.monto_total
    fill_in "Motivo", with: @campania_donacion.motivo
    fill_in "Nombre", with: @campania_donacion.nombre
    click_on "Create Campania donacion"

    assert_text "Campania donacion was successfully created"
    click_on "Back"
  end

  test "should update Campania donacion" do
    visit campania_donacion_url(@campania_donacion)
    click_on "Edit this campania donacion", match: :first

    fill_in "Anio limite", with: @campania_donacion.anio_limite
    fill_in "Beneficiario", with: @campania_donacion.beneficiario
    fill_in "Dia limite", with: @campania_donacion.dia_limite
    fill_in "Imagen", with: @campania_donacion.imagen
    fill_in "Mes limite", with: @campania_donacion.mes_limite
    fill_in "Monto actual", with: @campania_donacion.monto_actual
    fill_in "Monto total", with: @campania_donacion.monto_total
    fill_in "Motivo", with: @campania_donacion.motivo
    fill_in "Nombre", with: @campania_donacion.nombre
    click_on "Update Campania donacion"

    assert_text "Campania donacion was successfully updated"
    click_on "Back"
  end

  test "should destroy Campania donacion" do
    visit campania_donacion_url(@campania_donacion)
    click_on "Destroy this campania donacion", match: :first

    assert_text "Campania donacion was successfully destroyed"
  end
end
