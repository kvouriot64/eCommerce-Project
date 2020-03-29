class CreateOrderProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :order_products do |t|
      t.references :Order, null: false, foreign_key: true
      t.references :Product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
