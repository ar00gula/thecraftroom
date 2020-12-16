class CreateProjectCrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :project_crafts do |t|

      t.timestamps
    end
  end
end
