class CreateHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :video
      t.string :image
      t.string :title

      t.timestamps
    end
    change_column_null :heros, :video, false
    change_column_null :heros, :image, false
    change_column_null :heros, :title, false
  end
end
