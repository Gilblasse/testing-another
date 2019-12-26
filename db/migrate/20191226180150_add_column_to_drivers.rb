class AddColumnToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :current_location, :string
  end
end
