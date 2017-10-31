class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.belongs_to :game
      t.belongs_to :piece

      t.integer :to_row
      t.integer :to_column

      t.timestamps
    end
  end
end
