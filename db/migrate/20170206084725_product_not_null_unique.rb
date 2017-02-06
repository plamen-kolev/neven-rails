class ProductNotNullUnique < ActiveRecord::Migration[5.0]
  def change
    change_column_null :products, :title, false
    change_column_null :products, :slug, false
    change_column_null :products, :title, false
    change_column_null :products, :description, false
    change_column_null :products, :tips, false
    change_column_null :products, :benefits, false
    change_column_null :products, :featured, false
    change_column_null :products, :in_stock, false
    change_column_null :products, :hover_thumbnail, false
    change_column_null :products, :thumbnail, false 

    add_index :products, [:title], :unique => true
  end
end
