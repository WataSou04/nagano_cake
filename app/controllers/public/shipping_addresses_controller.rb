class Public::ShippingAddressesController < ApplicationController
  def index
    @shippingaddress = ShippingAddress.new
    @shippingaddresses = current_customer.shipping_addresses
  end
  
  def create
    puts params.inspect
    @shippingaddress = current_customer.shipping_addresses.build(shippingaddress_params)
    if @shippingaddress.save
      redirect_to shipping_addresses_path
    else
      @shippingaddresses = ShippingAddress.all
      render :index
    end
  end
  
  def edit
    @shippingaddress = ShippingAddress.find(params[:id])
  end
  
  def update
    @shippingaddress = ShippingAddress.find(params[:id])
    @shippingaddress.update(shippingaddress_params)
    redirect_to shipping_addresses_path
  end
  
  private
  
  def shippingaddress_params
    params.require(:shipping_address).permit(:postal_code, :address, :name, :customer_id)
  end
end
