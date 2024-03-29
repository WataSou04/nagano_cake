class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all
    
    is_updated = true
    if @order_detail.update(order_detail_params)
      @order.update(status: "in_production") if @order_detail.production_status == "in_production"
      @order_details.each do |order_detail|
        if order_detail.production_status != "completed"
          is_updated = false
        end
      end
      @order.update(status: "in_preparation") if is_updated
    end
    redirect_to admin_order_path(@order_detail.order.id)
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :production_status)
  end
end
