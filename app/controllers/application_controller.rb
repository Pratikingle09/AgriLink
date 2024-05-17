class ApplicationController < ActionController::Base
    before_action :set_cart_count

    private
  
    def set_cart_count        
      if user_signed_in?
        @cart_count = current_user.carts.count
      else
        @cart_count = 0
      end
      
    end
end
