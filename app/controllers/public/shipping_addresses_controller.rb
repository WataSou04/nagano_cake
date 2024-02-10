class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_address = Shipping_address.new
    @addresses = Address.all
  end
end
