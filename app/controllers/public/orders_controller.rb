class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @postage = 800
    @payment_method = params[:order][:payment_method]
    
    ary = []
    @cart_items.each do |cart_item|
      ary << cart_item.item.price * cart_item.amount
    end
    @cart_items_price = ary.sum
    @total_price = @postage + @cart_items_price
    
    @address_type = params[:order][:address]
    case @address_type
    when "member_address"
      @selected_address = current_customer.postal_code + " " + current_customer.address + " " + current_customer.last_name + current_customer.first_name
    when "registered_address"
      unless params[:order][:registered_address_id] == ""
        selected = Customer.find(params[:order][:registered_address_id])
        @selected_address = selected.postal_code + " " + selected.address + " " + selected.name
      else
        render :new
      end
    when "new_address"
      unless params[:order][:potal_code] == "" && params[:order][:address] == "" && params[:order][:name] == ""
        @selected_address = params[:order][:potal_code] + " " + params[:order][:address] + " " + params[:order][:name]
      else
        render :new
      end
    end
  end

  def index
  end

  def show
  end
end
