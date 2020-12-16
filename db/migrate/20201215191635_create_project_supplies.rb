class CreateProjectSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_supplies do |t|
      t.integer :supply_id
      t.integer :project_id

      t.timestamps
    end
  end
end
