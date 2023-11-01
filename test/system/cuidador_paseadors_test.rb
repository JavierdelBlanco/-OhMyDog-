require "application_system_test_case"

class CuidadorPaseadorsTest < ApplicationSystemTestCase
  setup do
    @cuidador_paseador = cuidador_paseadors(:one)
  end

  test "visiting the index" do
    visit cuidador_paseadors_url
    assert_selector "h1", text: "Cuidador paseadors"
  end

  test "should create cuidador paseador" do
    visit cuidador_paseadors_url
    click_on "New cuidador paseador"

    fill_in "Apellido", with: @cuidador_paseador.apellido
    fill_in "Foto", with: @cuidador_paseador.foto
    fill_in "Horarios", with: @cuidador_paseador.horarios
    fill_in "Nombre", with: @cuidador_paseador.nombre
    fill_in "Rol", with: @cuidador_paseador.rol
    click_on "Create Cuidador paseador"

    assert_text "Cuidador paseador was successfully created"
    click_on "Back"
  end

  test "should update Cuidador paseador" do
    visit cuidador_paseador_url(@cuidador_paseador)
    click_on "Edit this cuidador paseador", match: :first

    fill_in "Apellido", with: @cuidador_paseador.apellido
    fill_in "Foto", with: @cuidador_paseador.foto
    fill_in "Horarios", with: @cuidador_paseador.horarios
    fill_in "Nombre", with: @cuidador_paseador.nombre
    fill_in "Rol", with: @cuidador_paseador.rol
    click_on "Update Cuidador paseador"

    assert_text "Cuidador paseador was successfully updated"
    click_on "Back"
  end

  test "should destroy Cuidador paseador" do
    visit cuidador_paseador_url(@cuidador_paseador)
    click_on "Destroy this cuidador paseador", match: :first

    assert_text "Cuidador paseador was successfully destroyed"
  end
end
