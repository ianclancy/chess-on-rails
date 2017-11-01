class Game < ApplicationRecord
  has_many :pieces
  has_many :moves

  def black_in_check
    white_pieces.each do |piece|
      if !piece.row.nil?
        move = Move.new(game_id: id, piece_id: piece.id, to_row: black_king.row, to_column: black_king.column)
        if move.legal? && piece.legal_move?(move)
          return true
        end
      end
    end
    false
  end

  def black_king
    pieces.where(type: "King", side: "black")[0]
  end

  def black_pieces
    pieces.where(side: "black")
  end

  def square_occupant(row, column)
    pieces.where(game_id: id, row: row, column: column)[0]
  end

  def switch_turn
    if turn == "white"
      turn = "black"
    else
      turn = "white"
    end
  end

  def white_in_check
    black_pieces.each do |piece|
      move = Move.new(game_id: id, piece_id: piece.id, to_row: white_king.row, to_column: white_king.column)
      if move.legal? && piece.legal_move?(move)
        return true
      end
    end
    return false
  end

  def white_king
    pieces.where(type: "King", side: "white")[0]
  end

  def white_pieces
    pieces.where(side: "white")
  end
end
