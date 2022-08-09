class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :lastname
      t.string :firstname
      t.string :adress
      t.integer :role

      t.timestamps
    end
  end
end