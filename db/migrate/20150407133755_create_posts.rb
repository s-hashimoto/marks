class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :img1
      t.string :img2
      t.string :img3
      t.string :img4
      t.text :title
      t.text :description
      t.string :ratedanger
      t.string :ratepower
      t.string :ratesatisfy
      t.string :nights
      t.string :year
      t.string :month
      t.string :date
      t.string :status
      t.string :authorid
      t.string :placeid

      t.timestamps null: false
    end
  end
end
