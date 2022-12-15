class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum production_status: {impossible: 0, waiting: 1, working: 2, completion: 3}
  
  def subtotal
    (price*quantity*1.1).floor
  end
  
  def tax_inclued
    (price*1.1).floor
  end
  
  
end
