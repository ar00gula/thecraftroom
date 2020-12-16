class CreateProjectSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_supplies do |t|

      t.timestamps
    end
  end
end
