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

  def check
    if turn == "black" && black_in_check || turn == "white" && white_in_check
      return true
    end
    false
  end

  def checkmate
    if check
      pieces.where(side: turn).each do |piece|
        if !piece.row.nil?
          old_row = piece.row
          old_column = piece.column
          new_row = 1
          while new_row <= 8
            new_column = 1
            while new_column <= 8
              move = Move.new(game_id: id, piece_id: piece.id, to_row: new_row, to_column: new_column)
              if (piece.type == "Knight" || !move.invalid_direction? && !move.blocked?) && !move.friendly_fire? && piece.legal_move?(move)
                if move.capture?
                  captured_piece = move.to_occupant
                  old_captured_row = captured_piece.row
                  old_captured_column = captured_piece.column
                  captured_piece.row = nil
                  captured_piece.column = nil
                  captured_piece.save
                end
                piece.row = new_row
                piece.column = new_column
                piece.save
                if check
                  piece.row = old_row
                  piece.column = old_column
                  piece.save
                  if captured_piece
                    captured_piece.row = old_captured_row
                    captured_piece.column = old_captured_column
                    captured_piece.save
                  end
                else
                  piece.row = old_row
                  piece.column = old_column
                  piece.save
                  if captured_piece
                    captured_piece.row = old_captured_row
                    captured_piece.column = old_captured_column
                    captured_piece.save
                  end
                  return false
                end
              end
              new_column += 1
            end
            new_row += 1
          end
        end
      end
      return true
    end
    false
  end

  def not_turn
    if turn == "white"
      return "black"
    else
      return "white"
    end
  end

  def opponent_can_attack(coordinates)
    pieces.where(side: not_turn).each do |piece|
      if !piece.row.nil?
        move = Move.new(game_id: id, piece_id: piece.id, to_row: coordinates[0], to_column: coordinates[1])
        if !move.invalid_direction? && !move.blocked? && piece.legal_move?(move)
          return true
        end
      end
    end
    false
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
      if !piece.row.nil?
        move = Move.new(game_id: id, piece_id: piece.id, to_row: white_king.row, to_column: white_king.column)
        if move.legal? && piece.legal_move?(move)
          return true
        end
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
