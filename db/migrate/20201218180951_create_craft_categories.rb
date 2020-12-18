class CreateCraftCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :craft_categories do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
