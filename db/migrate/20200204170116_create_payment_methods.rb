class CreatePaymentMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_methods do |t|
      t.string :first_name
      t.string :last_name
      t.string :card_number
      t.string :expiration_date
      t.string :cvc
      t.string :card_nickname
      t.string :billing_address
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
