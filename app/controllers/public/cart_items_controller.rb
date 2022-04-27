class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all

  end
  
  def update
  end
  
  def destroy
    # @cart_item=CartItem.find(params[:id])
    # @item.destroy
    # redirect_to cart_items_path
  end

  def all_destroy
    @cart_items=CartItem.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  
  def create
    @cart_item=CartItem.new(cart_item_params)
    byebug
    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to root_path
    end
  end
  
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id,:customer_id)
  end
  
  
end

