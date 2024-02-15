class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    @order = Order.all
    binding.pry
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    
  end
end
