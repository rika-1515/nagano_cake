class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end
  
  def create
    item=Item.new(item_params)
    item.save
    redirect_to '/admin/items'
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:item_image,:name,:introduction,:price)
  end
  
  
  
end
