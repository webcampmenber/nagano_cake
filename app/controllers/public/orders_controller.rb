class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @orders = current_customer.address
  end

  def confirmation
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @sum = 0
    @cart_items = current_customer.cart_items.all
    if params[:order][:customer_address] == "1"
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
    elsif params[:order][:customer_addres] == "2"
        @order.name = Address.find(params[:order][:address_id]).name
        @order.address = Address.find(params[:order][:address_id]).address
        @order.postal_code = Address.find(params[:order][:address_id]).postal_code
    elsif params[:order][:customer_addres] == "3"
      address_new = current_customer.addresses.new
      address_new.name = (params[:order][:name])
      address_new.address = (params[:order][:address])
      address_new.postal_code = (params[:order][:postal_code])
      #if address_new.save
       #render :new
      #end
    end
  end

  def thanks
  end 
  
  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
     if @order.save!
       cart_items.each do |cart|
       order_item = OrderDetail.new
       order_item.item_id = cart.item_id
       order_item.order_id = @order.id
       order_item.quantity = cart.amount
       order_item.price = cart.item.price
       order_item.save!
     end
      redirect_to thanks_path
      cart_items.destroy_all
     end
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @orders = OrderDetail.all
  end
  
  def address_params
  params.require(:address).permit(:name, :address, :postal_code)
  end
  
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method, :total_payment, :shipping_cost)  
  end
end
