class CreateSkus < ActiveRecord::Migration[6.0]
  def change
    create_table :skus do |t|
      t.integer :index, null: false
      t.text :title, null: false
      t.integer :availability, null: false
      t.integer :price, null: false
      t.integer :final_price, null: false
      t.text :delivery_schema
      t.text :category, null: false
      t.text :brand, null: false
      t.integer :product_id, unique: true
      t.timestamps
      t.index :product_id, unique: true
    end
  end
end
