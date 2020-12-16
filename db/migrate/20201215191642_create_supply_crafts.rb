class CreateSupplyCrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :supply_crafts do |t|
      t.integer :craft_id
      t.integer :supply_id

      t.timestamps
    end
  end
end
