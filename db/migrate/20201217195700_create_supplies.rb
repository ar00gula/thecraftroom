class CreateSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :supplies do |t|
      t.string :name
      t.text :notes
      t.integer :supply_category_id

      t.timestamps
    end
  end
end
