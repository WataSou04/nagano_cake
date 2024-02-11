class Public::ShippingAddressesController < ApplicationController
  def index
    @shippingaddress = ShippingAddress.new
    @shippingaddresses = ShippingAddress.all
  end
  
  def create
    @shippingaddress = ShippingAddress.new(shippingaddress_params)
    if @shippingaddress.save
      redirect_to shipping_addresses_path
    else
      @shippingaddresses = ShippingAddress.all
      render :index
    end
  end
  
  private
  
  def shippingaddress_params
    params.require(:shippingaddress).permit(:postal_code, :address, :name)
  end
end
