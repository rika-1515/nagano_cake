class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all

  end
  
  def update
  end
  
  def destroy
  end

  def all_destroy
  end
  
  # ストロングパラメータ
  def create
    cart_item=CartItem.new(cart_item_params)
   # byebug
    if cart_item.save
      redirect_to '/items'
    else
      redirect_to root_path
    end
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id,:customer_id)
  end
  
  
end

