class AddColumnsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :origin_title, :string
    add_column :trips, :origin_address, :string
    add_column :trips, :destination_title, :string
    add_column :trips, :destination_address, :string
  end
end
