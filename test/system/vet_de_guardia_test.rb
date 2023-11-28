require "application_system_test_case"

class VetDeGuardiaTest < ApplicationSystemTestCase
  setup do
    @vet_de_guardium = vet_de_guardia(:one)
  end

  test "visiting the index" do
    visit vet_de_guardia_url
    assert_selector "h1", text: "Vet de guardia"
  end

  test "should create vet de guardium" do
    visit vet_de_guardia_url
    click_on "New vet de guardium"

    fill_in "Dia", with: @vet_de_guardium.dia
    fill_in "Direccion", with: @vet_de_guardium.direccion
    fill_in "Foto", with: @vet_de_guardium.foto
    fill_in "Mail", with: @vet_de_guardium.mail
    fill_in "Telefono", with: @vet_de_guardium.telefono
    click_on "Create Vet de guardium"

    assert_text "Vet de guardium was successfully created"
    click_on "Back"
  end

  test "should update Vet de guardium" do
    visit vet_de_guardium_url(@vet_de_guardium)
    click_on "Edit this vet de guardium", match: :first

    fill_in "Dia", with: @vet_de_guardium.dia
    fill_in "Direccion", with: @vet_de_guardium.direccion
    fill_in "Foto", with: @vet_de_guardium.foto
    fill_in "Mail", with: @vet_de_guardium.mail
    fill_in "Telefono", with: @vet_de_guardium.telefono
    click_on "Update Vet de guardium"

    assert_text "Vet de guardium was successfully updated"
    click_on "Back"
  end

  test "should destroy Vet de guardium" do
    visit vet_de_guardium_url(@vet_de_guardium)
    click_on "Destroy this vet de guardium", match: :first

    assert_text "Vet de guardium was successfully destroyed"
  end
end
