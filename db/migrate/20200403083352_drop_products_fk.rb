# frozen_string_literal: true

class DropProductsFk < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :products, :OrderStatuses

    add_column :products, :Order_status_id, :integer
    add_foreign_key :products, :order_statuses
  end
end
