class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.string :title
      t.string :url
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
