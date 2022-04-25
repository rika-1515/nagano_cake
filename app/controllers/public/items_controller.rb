class Public::ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items = Item.where(is_active: 'true').page(params[:page]).per(8)
    @count = Item.where(is_active: 'true').count
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=Cart_item.new
  end
end
