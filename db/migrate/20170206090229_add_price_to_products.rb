class AddPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal, :precision => 8, :scale => 2
    change_column_null :products, :price, false
  end
end
