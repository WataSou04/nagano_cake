class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :name,        null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :address,     null: false, default: "1"
      t.timestamps
    end
  end
end
