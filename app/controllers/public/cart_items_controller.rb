class Public::CartItemsController < ApplicationController
  def index
    @cartitems = CartItem.all
    @total_amount = 0
  end
  
  def create
    @cartitem = CartItem.new(cartitem_params)
    @cartitem.save
    redirect_to cart_items_path
  end
  
  def destroy
    @cartitem = CartItem.find(params[:id])
    @cartitem.destroy
    redirect_to cart_items_path
  end
  
  private
  
  def cartitem_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
