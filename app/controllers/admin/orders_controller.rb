class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details=Order_details.find(params[:id])
  end
  
  def update
  end
  
  
  
  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:status)
  end
  
  def order_details_params
    params.require(:order_details).permit(:item_image,:name,:introduction,:price,:genre_id,:is_active)
  end
  
  
end
