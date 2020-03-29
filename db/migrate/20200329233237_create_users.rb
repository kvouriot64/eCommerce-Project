class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :street_address
      t.string :postal_code
      t.references :Province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
