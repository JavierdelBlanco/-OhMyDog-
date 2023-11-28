require "test_helper"

class VetDeGuardiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vet_de_guardium = vet_de_guardia(:one)
  end

  test "should get index" do
    get vet_de_guardia_url
    assert_response :success
  end

  test "should get new" do
    get new_vet_de_guardium_url
    assert_response :success
  end

  test "should create vet_de_guardium" do
    assert_difference("VetDeGuardium.count") do
      post vet_de_guardia_url, params: { vet_de_guardium: { dia: @vet_de_guardium.dia, direccion: @vet_de_guardium.direccion, foto: @vet_de_guardium.foto, mail: @vet_de_guardium.mail, telefono: @vet_de_guardium.telefono } }
    end

    assert_redirected_to vet_de_guardium_url(VetDeGuardium.last)
  end

  test "should show vet_de_guardium" do
    get vet_de_guardium_url(@vet_de_guardium)
    assert_response :success
  end

  test "should get edit" do
    get edit_vet_de_guardium_url(@vet_de_guardium)
    assert_response :success
  end

  test "should update vet_de_guardium" do
    patch vet_de_guardium_url(@vet_de_guardium), params: { vet_de_guardium: { dia: @vet_de_guardium.dia, direccion: @vet_de_guardium.direccion, foto: @vet_de_guardium.foto, mail: @vet_de_guardium.mail, telefono: @vet_de_guardium.telefono } }
    assert_redirected_to vet_de_guardium_url(@vet_de_guardium)
  end

  test "should destroy vet_de_guardium" do
    assert_difference("VetDeGuardium.count", -1) do
      delete vet_de_guardium_url(@vet_de_guardium)
    end

    assert_redirected_to vet_de_guardia_url
  end
end
