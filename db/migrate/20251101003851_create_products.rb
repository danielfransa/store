class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :brand
      t.decimal :price_base

      t.timestamps
    end
  end
end
