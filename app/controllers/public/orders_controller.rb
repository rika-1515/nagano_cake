class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
    @deliveries=@customer.deliveries
  end
  
  def log
    @order=Order.new(order_params) 
    @cart_items=current_customer.cart_items
    @total=@cart_items.inject(0){|sum, cart_item| sum + cart_item.item_subtotal}
    @order.total_price=@total
    @order.delivery_price='800'
    # @order.customer_id = current_customer.id
    # byebug
    if params[:order][:select_address]=="0"
      
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.first_name+current_customer.last_name

    elsif params[:order][:select_address] == '1'
      
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name
      
    elsif params[:order][:select_address] == '2'
      
      @order.postal_code = @order.postal_code
      @order.address = @order.address
      @order.name = @order.name
    
    end
  end
  
  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to orders_thanx_path
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
    params.require(:order).permit(:pay_method,:postal_code,:address,:name,:customer_id)
  end
  
end
