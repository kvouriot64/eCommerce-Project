class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.float :total_cost
      t.datetime :order_date
      t.references :User, null: false, foreign_key: true
      t.references :Status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
