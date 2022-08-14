class AddNbrDays < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nbr_days, :float ,default: 20
    add_column :demandes, :days, :integer 
  end
end
