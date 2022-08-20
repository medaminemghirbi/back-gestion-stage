class Updatedemandes < ActiveRecord::Migration[7.0]
  def change
    add_column :demandes, :user_id, :integer
    add_index  :demandes, :user_id
    add_column :demandes, :motif_id, :integer
    add_index  :demandes, :motif_id
    add_index  :demandes, :start_date
    add_index  :demandes, :end_date
    add_index :demandes, [:start_date, :end_date], unique: true
    add_index :demandes, [:user_id, :motif_id], unique: true
  end
end

