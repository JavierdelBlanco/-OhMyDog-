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

    fill_in "Ambulatorium", with: @historia_c.ambulatorium_id
    fill_in "Castracion", with: @historia_c.castracion_id
    fill_in "Desparasitacion", with: @historia_c.desparasitacion_id
    fill_in "Perrito", with: @historia_c.perrito_id
    fill_in "Vacuna e", with: @historia_c.vacuna_e_id
    fill_in "Vacuna r", with: @historia_c.vacuna_r_id
    click_on "Create Historia c"

    assert_text "Historia c was successfully created"
    click_on "Back"
  end

  test "should update Historia c" do
    visit historia_c_url(@historia_c)
    click_on "Edit this historia c", match: :first

    fill_in "Ambulatorium", with: @historia_c.ambulatorium_id
    fill_in "Castracion", with: @historia_c.castracion_id
    fill_in "Desparasitacion", with: @historia_c.desparasitacion_id
    fill_in "Perrito", with: @historia_c.perrito_id
    fill_in "Vacuna e", with: @historia_c.vacuna_e_id
    fill_in "Vacuna r", with: @historia_c.vacuna_r_id
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
