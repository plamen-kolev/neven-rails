class CategoryNotNullUnique < ActiveRecord::Migration[5.0]
  def change
    change_column_null :categories, :title, false
    change_column_null :categories, :slug, false
    change_column_null :categories, :thumbnail, false
    change_column_null :categories, :description, false

    add_index :categories, [:title], :unique => true
  end
end
