class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

  def top
    #  puts "------------test2"
      @orders=Order.page(params[:page])
      # # @order_amount = OrderDetail.find_by(:order_id).item_amount.sum
      # @order_amounts = 
      # (@orders.order_details.each do |o|
      # o.item_amount
      # end).sum
  end
    
end