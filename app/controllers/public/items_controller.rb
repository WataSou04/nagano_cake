class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page])
    else
      @items = Item.page(params[:page])
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cartitem = CartItem.new
  end
end
