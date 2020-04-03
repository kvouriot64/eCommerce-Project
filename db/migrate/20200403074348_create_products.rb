# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    drop_table :products

    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.integer :price
      t.references :OrderStatus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
