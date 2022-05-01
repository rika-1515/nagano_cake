class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    # @order_details=OrderDetails.find(params[:id])
  end
  
  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end
  
  
  
  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:status)
  end
  
  # def order_details_params
  #   params.require(:order_details).permit(:item_image,:name,:introduction,:price,:genre_id,:is_active)
  # end
  
  
end
