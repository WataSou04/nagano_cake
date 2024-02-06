class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    if params[:item_name]
      @items = Item.looks(params[:search], params[:name])
    else
      @items = Item.all
    end
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
