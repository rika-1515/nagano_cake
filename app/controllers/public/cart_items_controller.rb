class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
    @total=@cart_items.inject(0){|sum, cart_item| sum + cart_item.item_subtotal}
  end
  
  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path

  end
  
  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items=current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  
  def create
    @cart_item=CartItem.new(cart_item_params)
    cart_item=CartItem.find_by(item_id: params[:cart_item][:item_id])
    @cart_items=current_customer.cart_items
      if cart_item.present?
        new_amount=cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
      else
        @cart_item.save
      end
    redirect_to cart_items_path
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id,:customer_id)
  end
  
  
end

