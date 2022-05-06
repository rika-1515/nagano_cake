class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @customer=current_customer
    @deliveries=@customer.deliveries
    
    
    
  end
  
  def log
    @order=Order.new(order_params)
    # @order_details=OrderDetail.new
    @cart_items=current_customer.cart_items
    @total=@cart_items.inject(0){|sum, cart_item| sum + cart_item.item_subtotal}
    @order.delivery_price='800'
    @order.total_price=@total + @order.delivery_price
    
    # @order.customer_id = current_customer.id
    # byebug
    if params[:order][:select_address]=="0"
      
      @order.postal_code=current_customer.postal_code
      @order.address=current_customer.address
      @order.name=current_customer.last_name+current_customer.first_name

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
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |f|
      @order_detail = OrderDetail.new
      @order_detail.item_id = f.item_id
      @order_detail.item_amount = f.amount
      @order_detail.price_tax = f.item.price * 1.1
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    
    
    
    @cart_items.destroy_all
    redirect_to orders_thanx_path
  end

  def thanx
  end

  def index
    @customer=current_customer
    @orders=@customer.orders
  end

  def show
    @order=Order.find(params[:id])
    # @subtotal=@order.order_detail.price_tax * @order.order_detail.item_amount
    # byebug
  end
  
  
  private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:pay_method,:postal_code,:address,:name,:customer_id,:delivery_price,:total_price,order_details_attributes: [:item_id,:item_amount,:price_tax,:order_id])
  end
  
  # def order_details_params
  #   params.require(:order_details).permit(:item_id,:item_amount,:price_tax,:order_id)
  # end
  
end
