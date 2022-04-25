class Public::CartItemsController < ApplicationController
  def index
    @cart_items=Crart.all
  end
  
  def update
  end
  
  def destroy
  end

  def all_destroy
  end
  
  def create
  end
  
  private
  # ストロングパラメータ
  def cart_item_params
    params.require(:cart_item).permit(:status)
  end
  
end
