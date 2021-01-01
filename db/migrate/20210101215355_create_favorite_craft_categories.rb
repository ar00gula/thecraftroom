class CreateFavoriteCraftCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_craft_categories do |t|
      t.integer :user_id
      t.integer :craft_category_id

      t.timestamps
    end
  end
end
