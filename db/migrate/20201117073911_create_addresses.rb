class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,     null: false
      t.integer :shipping_area_id, null: false
      t.string  :municipal,      null: false
      t.string  :house_number,   null: false
      t.string  :building
      t.string  :phone_number,   null: false
      t.references :order,      foreign_key: true

      t.timestamps
    end
  end
end
