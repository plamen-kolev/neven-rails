class CreateStockists < ActiveRecord::Migration[5.0]
  def change
    create_table :stockists do |t|
      t.string :slug, null: false
      t.string :title, null: false, unique: true
      t.string :address, null: false
      t.decimal :lat, null: false
      t.decimal :lng, null: false
      t.string :thumbnail, null: false

      t.timestamps
    end
  end
end
