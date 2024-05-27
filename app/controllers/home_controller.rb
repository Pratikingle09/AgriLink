class HomeController < ApplicationController
  def index  
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
          image_path:"online-shopping.png" ,
          title:"Online Store",
          background:"#7DEC3B7"
        }
  end
end
