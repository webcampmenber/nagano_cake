# frozen_string_literal: true

class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
    
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.integer :price
      t.boolean :is_active
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :genres do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :cart_items do |t|
     t.integer :item_id
     t.integer :customer_id
     t.integer :amount
     t.datetime :created_at
     t.datetime :updated_at
    end
    
    create_table :orders do |t|
     t.integer :customer_id
     t.string :postal_code
     t.string :address
     t.string :name
     t.integer :shipping_cost
     t.integer :total_payment
     t.integer :payment_method
     t.integer :status
     t.datetime :created_at
     t.datetime :updated_at
    end
    
    create_table :order_details do |t|
      t.integer :customer_id
      t.integer :items_id
      t.integer :quanitity
      t.integer :price
      t.integer :production_status
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    add_index :customers, :email,                unique: true
    add_index :customers, :reset_password_token, unique: true
    # add_index :customers, :confirmation_token,   unique: true
    # add_index :customers, :unlock_token,         unique: true
  end
end
