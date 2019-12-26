class RemoveAddressIdFromTrips < ActiveRecord::Migration
  def change
    remove_column :trips, :address_id
  end
end
