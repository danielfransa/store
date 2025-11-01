class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.references :client, null: true, foreign_key: true
      t.datetime :date
      t.decimal :total_value

      t.timestamps
    end
  end
end
