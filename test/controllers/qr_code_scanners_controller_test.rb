require 'test_helper'

class QrCodeScannersControllerTest < ActionController::TestCase
  test "should get read_qr" do
    get :read_qr
    assert_response :success
  end

  test "should get create_qr" do
    get :create_qr
    assert_response :success
  end

end
