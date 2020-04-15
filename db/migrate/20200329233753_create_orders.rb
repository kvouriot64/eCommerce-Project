# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.float :total_cost
      t.datetime :order_date
      t.references :user, null: false, foreign_key: true
      t.references :order_statuses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
