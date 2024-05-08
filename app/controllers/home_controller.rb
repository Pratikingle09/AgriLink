class HomeController < ApplicationController
  def index
    if user_signed_in?
        c_u=current_user
        acc_type =c_u.account_type
        if acc_type == "student"
         image_path_l="learning.png"
          title_l="Learning Dashboard"
        end
  
        if acc_type == "seller"
          image_path_p="product.png"
           title_p="Product In Stock"
        end
        
        
        @cart1={
          image_path:image_path_p || "question.png",
          title:title_p || "Questions",
          background:"#77CE80"
        }
  
        @cart2={
          image_path:"notification.png",
          title:"Notifications",
          background:"#A195EB"
        }
  
        @cart3={
          image_path:"stream.png",
          title:"Live Feed",
          background:"#9D97C2"
        }
  
        @cart4={
          image_path:image_path_l || "online-shopping.png" ,
          title:title_l || "Online Store",
          background:"#7DEC3B7"
        }
    else
      redirect_to new_user_session_path
    end
  end
end
