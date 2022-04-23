class Public::ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @items = Item.where(is_active: 'true')
    @itemsp = @items.page(params[:page]).per(8)
    @count = @items.count
  end

  def show
    @item=Item.find(params[:id])
  end
end
