class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :type, foreign_key: true
      t.text :description
      t.string :quantity
      t.float :price
      t.string :shop_product_id

      t.timestamps
    end
  end
end
