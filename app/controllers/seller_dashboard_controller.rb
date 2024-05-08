class SellerDashboardController < ApplicationController
  def index
    @products = current_user.products
  end

  def products
    @products = current_user.products
  end

  def orders
    @orders = OrderItem.where(seller_id: current_user.id).map(&:order).uniq
  end
end
