class AddAddressColumnToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :address, :string
  end
end
