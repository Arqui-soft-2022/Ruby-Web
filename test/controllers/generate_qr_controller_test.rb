require "test_helper"

class GenerateQrControllerTest < ActionDispatch::IntegrationTest
  test "should get createQR" do
    get generate_qr_createQR_url
    assert_response :success
  end
end
