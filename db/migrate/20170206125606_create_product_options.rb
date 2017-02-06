class CreateProductOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :product_options do |t|
      t.string :slug, null: false
      t.string :title, null: false
      t.integer :weight, null: false
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
    add_reference :product_options, :product, foreign_key: true
    remove_column :products, :price
  end
end
