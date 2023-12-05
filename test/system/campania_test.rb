require "application_system_test_case"

class CampaniaTest < ApplicationSystemTestCase
  setup do
    @campanium = campania(:one)
  end

  test "visiting the index" do
    visit campania_url
    assert_selector "h1", text: "Campania"
  end

  test "should create campanium" do
    visit campania_url
    click_on "New campanium"

    fill_in "Anio limite", with: @campanium.anio_limite
    fill_in "Beneficiario", with: @campanium.beneficiario
    fill_in "Dia limite", with: @campanium.dia_limite
    fill_in "Imagen", with: @campanium.imagen
    fill_in "Mes limite", with: @campanium.mes_limite
    fill_in "Monto actual", with: @campanium.monto_actual
    fill_in "Monto total", with: @campanium.monto_total
    fill_in "Motivo", with: @campanium.motivo
    click_on "Create Campanium"

    assert_text "Campanium was successfully created"
    click_on "Back"
  end

  test "should update Campanium" do
    visit campanium_url(@campanium)
    click_on "Edit this campanium", match: :first

    fill_in "Anio limite", with: @campanium.anio_limite
    fill_in "Beneficiario", with: @campanium.beneficiario
    fill_in "Dia limite", with: @campanium.dia_limite
    fill_in "Imagen", with: @campanium.imagen
    fill_in "Mes limite", with: @campanium.mes_limite
    fill_in "Monto actual", with: @campanium.monto_actual
    fill_in "Monto total", with: @campanium.monto_total
    fill_in "Motivo", with: @campanium.motivo
    click_on "Update Campanium"

    assert_text "Campanium was successfully updated"
    click_on "Back"
  end

  test "should destroy Campanium" do
    visit campanium_url(@campanium)
    click_on "Destroy this campanium", match: :first

    assert_text "Campanium was successfully destroyed"
  end
end
