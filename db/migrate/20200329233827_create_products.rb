class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :price
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
