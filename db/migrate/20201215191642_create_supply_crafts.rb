class CreateSupplyCrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :supply_crafts do |t|

      t.timestamps
    end
  end
end
