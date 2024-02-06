class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Csutomer.find(params[:id])
  end

  def edit
  end
end
