class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.belongs_to :game

      t.string :type
      t.string :side
      t.integer :row
      t.integer :column
      t.boolean :moved

      t.timestamps
    end
  end
end
