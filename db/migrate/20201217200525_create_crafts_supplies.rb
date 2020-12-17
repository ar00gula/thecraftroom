class CreateCraftsSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :crafts_supplies do |t|
      t.integer :supply_id
      t.integer :craft_id

      t.timestamps
    end
  end
end
