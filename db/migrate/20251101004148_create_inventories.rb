class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.references :sku, null: false, foreign_key: true
      t.references :local, null: true, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
