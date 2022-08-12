class AddNbrDays < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nbr_days, :integer ,default: 20
  end
end
