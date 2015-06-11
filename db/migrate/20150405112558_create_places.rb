class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :img
      t.string :altitude
      t.text :description
      t.string :areaid

      t.timestamps null: false
    end
  end
end
