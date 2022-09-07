class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|


     t.string :adress_number
     t.string :adress
     t.string :adress_name
     t.integer :price
     t.integer :payment_method
     t.integer :postage
     t.integer :status
     t.timestamps
    end
  end
end
