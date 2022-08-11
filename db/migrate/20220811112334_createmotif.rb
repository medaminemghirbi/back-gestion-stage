class Createmotif < ActiveRecord::Migration[7.0]
  def change
    create_table :motifs do |t|
      t.string :reason
      t.timestamps
    end  
  end
end