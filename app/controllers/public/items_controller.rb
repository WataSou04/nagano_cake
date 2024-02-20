class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if Genre.find(params[:genre_id]) == ""
      @items = Item.page(params[:page])
    else
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cartitem = CartItem.new
  end
end
