class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :address_id
      t.integer :passenger_id 
      t.integer :driver_id
      t.timestamps null: false
    end
  end
end
