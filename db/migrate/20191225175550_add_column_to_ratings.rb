class AddColumnToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :trip_id , :integer
  end
end
