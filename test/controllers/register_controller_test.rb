require "test_helper"

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get registro" do
    get register_registro_url
    assert_response :success
  end
end
