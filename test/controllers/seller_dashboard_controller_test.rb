require "test_helper"

class SellerDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_dashboard_index_url
    assert_response :success
  end

  test "should get products" do
    get seller_dashboard_products_url
    assert_response :success
  end

  test "should get orders" do
    get seller_dashboard_orders_url
    assert_response :success
  end
end
