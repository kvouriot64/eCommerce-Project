# frozen_string_literal: true

class RemoveImageFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :image
  end
end
