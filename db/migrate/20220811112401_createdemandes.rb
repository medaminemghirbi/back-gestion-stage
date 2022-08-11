class Createdemandes < ActiveRecord::Migration[7.0]
  def change
    create_table :demandes do |t|
      t.date :start_date
      t.date :end_date
      t.integer :status
      t.timestamps
      t.belongs_to :motif , foreign_key: true
    end

  end
end