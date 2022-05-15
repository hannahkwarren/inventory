class CreateWarehouseItems < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_items do |t|
      t.references :warehouse, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity
      t.integer :aisle
      t.timestamps
    end
  end
end
