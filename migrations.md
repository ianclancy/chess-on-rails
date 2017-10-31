rails g migration create_games

class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :turn

      t.timestamps
    end
  end
end

rails g migration create_pieces

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

rails g migration create_moves

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
