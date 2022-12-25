class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
    redirect_to customers_path(@customer.id)
    end
  end

  def withdrawal_confirmation
    @customer = current_customer
  end

  def withdrawal_process
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
    flash[:alert] = "退会しました。"
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
  
end
