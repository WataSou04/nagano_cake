class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @items = @items.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @genres = Genre.all
    @genre_id = params[:genre_id]
    if params[:genre_name]
      where('name LIKE ?', "#{@genre_id}")
    else
      all
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
