class Createdemandes < ActiveRecord::Migration[7.0]
  def change
    create_table :demandes do |t|
      t.date :start_date
      t.date :end_date
      t.integer :status ,default: 0
      t.string :refus_reason
      t.timestamps
    end

  end
end