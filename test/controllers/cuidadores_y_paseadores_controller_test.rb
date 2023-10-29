require "test_helper"

class CuidadoresYPaseadoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cuidadores_y_paseadores_index_url
    assert_response :success
  end
end
