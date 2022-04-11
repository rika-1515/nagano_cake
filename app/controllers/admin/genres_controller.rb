class Admin::GenresController < ApplicationController
  def index
    @genre=Genre.new
    @genres=Genre.all
  end
  
  def create
    genre=Genre.new(genre_params)
    genre.save
    redirect_to '/admin/genres'
  end

  def edit
  end
  
  
private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:title)
  end
  
  
end
