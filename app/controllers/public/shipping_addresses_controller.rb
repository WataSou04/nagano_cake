class Public::ShippingAddressesController < ApplicationController
  def index
    @shippingaddress = ShippingAddress.new
    @shippingaddresses = ShippingAddress.all
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
  
  private
  
  def shippingaddress_params
    params.require(:shipping_address).permit(:postal_code, :address, :name, :customer_id)
  end
end
