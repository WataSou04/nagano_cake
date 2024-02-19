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
    @order.billing_amount = @total_price
    @cart_itmes = current_customer.cart_items
    @order_new = Order.new
    render :check
  end
  
  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all
    
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.save
    end
    
    CartItem.destroy_all
    redirect_to orders_completion_path
  end
  
  def completion
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: @order.id)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :billing_amount, :status, :customer_id, :created_at)
  end
end
