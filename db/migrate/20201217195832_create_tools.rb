class CreateTools < ActiveRecord::Migration[6.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :brand
      t.string :description
      t.string :count

      t.timestamps
    end
  end
end
