class CreateCraftsTools < ActiveRecord::Migration[6.0]
  def change
    create_table :crafts_tools do |t|
      t.integer :craft_id
      t.integer :tool_id

      t.timestamps
    end
  end
end
