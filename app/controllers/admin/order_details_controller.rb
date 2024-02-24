class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.find(params[:id])
    @order_details.update(orderdetail_params)
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def orderdetail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :production_status)
  end
end
