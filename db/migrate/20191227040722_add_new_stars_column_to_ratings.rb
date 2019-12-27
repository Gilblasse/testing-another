class AddNewStarsColumnToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :stars, :integer, :default => 0
  end
end
