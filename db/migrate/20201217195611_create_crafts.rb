class CreateCrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :crafts do |t|
      t.string :name
      t.text :notes
      t.integer :craft_category_id

      t.timestamps
    end
  end
end
