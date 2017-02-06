class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.string :thumbnail, null: false
      t.timestamps
    end
    add_reference :product_images, :product, foreign_key: true
  end
end
