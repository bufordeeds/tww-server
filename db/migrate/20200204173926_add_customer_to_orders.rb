class AddCustomerToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :customer, null: false, foreign_key: true
  end
end
