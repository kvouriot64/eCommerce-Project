# frozen_string_literal: true

class ChangePriceToInteger < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end
