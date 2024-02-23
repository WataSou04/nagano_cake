class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @order_details.update
    redirect_to show
  end
end
