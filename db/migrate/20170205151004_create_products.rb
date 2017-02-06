class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :thumbnail
      t.string :tags
      t.string :hidden_tags
      t.string :title
      t.text :description
      t.text :tips
      t.text :benefits
      t.boolean :featured
      t.string :slug
      t.boolean :in_stock
      t.string :hover_thumbnail

      t.timestamps
    end
    add_reference :products, :category, foreign_key: true

  end
end
