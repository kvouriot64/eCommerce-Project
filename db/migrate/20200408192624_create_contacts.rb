class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :description
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
