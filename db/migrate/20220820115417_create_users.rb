class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :lastname
      t.string :firstname
      t.string :adress
      t.integer :role
      t.boolean :email_confirmed, :default => false
      t.string :confirm_token
      t.float :nbr_days ,default: 20
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.timestamps
    end
  end
end

