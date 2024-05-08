class CartsController < ApplicationController
    def index
      @order = current_user.orders.build
      @cart_items = current_user.carts.includes(:product)
    end
  
    def add_to_cart
      product = Product.find(params[:product_id])
      current_user.carts.create(product: product, quantity: 1)
      redirect_to carts_path
    end
  
    def update_quantity
      cart_item = current_user.carts.find(params[:id])
      cart_item.update(quantity: params[:quantity])
      redirect_to carts_path
    end
  
    def remove_from_cart
      cart_item = current_user.carts.find(params[:id])
      cart_item.destroy
      redirect_to carts_path
    end

    def checkout
     @cart_items = current_user.carts.includes(product: :user)
      @order = current_user.orders.build(order_params)
      

      @cart_items.each do |cart_item|
        seller = cart_item.product.user
        order_item = @order.order_items.build(product_id: cart_item.product.id, quantity: cart_item.quantity)
        order_item.seller_id = seller.id
      end

      @order.mobile = current_user.mobile
      if @order.save
        clear_cart_items
        redirect_to root_path
      else
        render 'cart'
      end
    end
    
    private
    
    def order_params
      params.require(:order).permit(:address)
    end
    
    def clear_cart_items
      user_cart_items = Cart.where(user_id: current_user.id)
      user_cart_items.destroy_all
    end
    
  
end
