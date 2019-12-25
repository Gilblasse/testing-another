class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :name
      t.integer :ratingable_id
      t.string :ratingable_type

      t.timestamps null: false
    end
  end
end
