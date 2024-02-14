class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end
  
  def check
    
  end

  def index
  end

  def show
  end
end
