class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer=Customer.find(current_customer.id)
  end
  
  def update
    @customer=Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def quit
  end
  
  def out
    @customer=current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
    private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number)
  end
  
  
end
