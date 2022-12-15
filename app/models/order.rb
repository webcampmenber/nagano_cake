class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum status: {waiting: 0, confirmation: 1, production: 2, preparing: 3, shipped: 4}
  
  def full_address
    "〒" + postal_code + " " + address + " " + name
  end
  
  def subtotal
    item.with_tax_price * amount
  end
end
