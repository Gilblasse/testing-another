class RemoveTripsColumn < ActiveRecord::Migration
  def change
    remove_column :trips, :address
  end
end
