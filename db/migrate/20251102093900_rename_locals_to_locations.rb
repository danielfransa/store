class RenameLocalsToLocations < ActiveRecord::Migration[8.0]
  def change
    rename_table :locals, :locations

    rename_column :inventories, :local_id, :location_id
  end
end
