class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path
  end
  
  
  private
  # ストロングパラメータ
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
  # def authenticate_admin!
  #   redirect_to root_path
  # end
  
end
