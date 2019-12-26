class RenameRatingsColumn < ActiveRecord::Migration
  def change
    rename_column :ratings, :name, :comment
  end
end
