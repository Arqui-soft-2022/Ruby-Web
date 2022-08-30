require "test_helper"

class CrearQrControllerTest < ActionDispatch::IntegrationTest
  test "should get creaQR" do
    get crear_qr_creaQR_url
    assert_response :success
  end
end
