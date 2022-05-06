class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
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
  
  # def authenticate_admin!
  #   redirect_to root_path
  # end
  
  # def order_details_params
  #   params.require(:order_details).permit(:item_image,:name,:introduction,:price,:genre_id,:is_active)
  # end
  
  
end
