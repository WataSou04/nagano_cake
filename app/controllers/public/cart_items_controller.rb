class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total_amount = 0
  end
  
  def create
    @cart_item = CartItem.new(cartitem_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def update
    @cart_items = CartItem.all
    @cart_items.update(cartitem_params)
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
  
  private
  
  def cartitem_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end
end
