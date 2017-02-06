class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :thumbnail, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :slug, null: false

      t.timestamps
    end

    create_join_table :products, :ingredients do |t|
      t.index [:product_id, :ingredient_id]
    end
  end
end
