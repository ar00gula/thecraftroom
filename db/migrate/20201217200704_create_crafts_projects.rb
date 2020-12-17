class CreateCraftsProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :crafts_projects do |t|
      t.integer :craft_id
      t.integer :project_id

      t.timestamps
    end
  end
end
