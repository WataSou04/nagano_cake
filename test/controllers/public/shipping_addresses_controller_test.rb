require "test_helper"

class Public::ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_shipping_addresses_index_url
    assert_response :success
  end
end
