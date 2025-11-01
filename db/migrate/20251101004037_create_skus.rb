class CreateSkus < ActiveRecord::Migration[8.0]
  def change
    create_table :skus do |t|
      t.references :product, null: false, foreign_key: true
      t.string :code
      t.string :color
      t.string :size
      t.decimal :price_sale

      t.timestamps
    end
  end
end
