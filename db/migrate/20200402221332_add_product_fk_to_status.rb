# frozen_string_literal: true

class AddProductFkToStatus < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :Order_status_id, :integer
    add_foreign_key :products, :order_statuses
  end
end
