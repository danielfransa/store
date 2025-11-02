class ChangeSaleItemsSkuToInventory < ActiveRecord::Migration[8.0]
  def change
    remove_index :sale_items, :sku_id if index_exists?(:sale_items, :sku_id)
    remove_column :sale_items, :sku_id, :integer

    add_reference :sale_items, :inventory, null: false, foreign_key: true
  end
end
