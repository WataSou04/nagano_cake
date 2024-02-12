class Public::CartItemsController < ApplicationController
  def index
    @cartitem = CartItem.new
    @cartitems = CartItem.all
  end
end
