class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @items = @items.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
