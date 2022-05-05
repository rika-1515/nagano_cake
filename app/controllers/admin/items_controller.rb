class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!

  def index
    @items=Item.page(params[:page]).per(10)
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(item.id)
    else
      @genres=Genre.all
      render :new
    end
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
    @genres=Genre.all
  end
  
  def update
    item=Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end
  
  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:item_image,:name,:introduction,:price,:genre_id,:is_active)
  end
  
  # def authenticate_admin!
  #   redirect_to root_path
  # end
  
end
