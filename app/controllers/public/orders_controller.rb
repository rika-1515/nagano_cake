class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
    # @delivery=Delivery.new
    @deliveries=@customer.deliveries
  end
  
  def create
    @order=Order.new(order_params)
    @order.customer_id = current_customer.id
    order.save
    redirect_to orders_thanx_path
  end

  def log
    @order=Order.new(order_params)
    
    
    
  end

  def thanx
  end

  def index
  end

  def show
  end
  
  
  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:pay_method,:postal_code,:address,:name,:delivery_id)
  end
  
end
