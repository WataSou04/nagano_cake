class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end
  
  def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @order_details.update
    redirect_to show
  end
end