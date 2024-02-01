class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customers_information_edit_path
  end
  
  def check
    @customer = current_customer
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to about_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_naem_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
