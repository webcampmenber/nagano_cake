class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer  :customer_id
      t.integer  :items_id
      t.integer  :quanitity
      t.integer  :price
      t.integer  :production_status
      t.timestamps
    end
  end
end
