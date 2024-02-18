class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @postage = 800
    
    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.with_tax_price * cart_item.amount
    end
    @cart_items_price = ary.sum
    @total_price = @postage + @cart_items_price
    
    if params[:order][:address_type] == "0"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
    elsif params[:order][:address_type] == "1"
      @address = ShippingAddress.find(params[:order][:address_id])
      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address = @address.address
    elsif params[:order][:address_type] == "2"
      @order.customer_id = current_customer.id
    end
    @cart_itmes = current_customer.cart_items
    
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :billing_amount, :status, :customer_id)
  end
end
