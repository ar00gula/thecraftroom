class CreateProjectCrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_crafts do |t|
      t.integer :craft_id
      t.integer :project_id

      t.timestamps
    end
  end
end
