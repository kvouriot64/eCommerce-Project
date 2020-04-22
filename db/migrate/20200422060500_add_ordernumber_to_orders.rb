# frozen_string_literal: true

class AddOrdernumberToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_number, :string
  end
end
