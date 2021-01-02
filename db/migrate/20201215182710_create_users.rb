class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :uid
      t.string :email
      t.string :image

      t.timestamps
    end
  end
end
