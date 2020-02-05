class CreateAddressBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :address_books do |t|
      t.string :address
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
