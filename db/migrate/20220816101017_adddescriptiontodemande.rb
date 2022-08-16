class Adddescriptiontodemande < ActiveRecord::Migration[7.0]
  def change
    add_column :demandes, :description, :string
  end
end
