class Move < ApplicationRecord
  belongs_to :game
  belongs_to :piece

  def blocked?
    if intermediate_pieces.empty? || piece.type == "Knight"
      return false
    else
      return true
    end
  end

  def capture?
    if to_occupant && to_occupant.side != piece.side
      return true
    else
      return false
    end
  end

  def castle?
    if !game.check && piece.type == "King" && distance.abs == 2 && direction == "horizontal" && !piece.moved && !game.opponent_can_attack(castle_empty_space)
      if castle_type == "kingside"
        rook = game.square_occupant(castle_row, 8)
        if rook && rook.type == "Rook" && !rook.moved
          return true
        end
      elsif castle_type == "queenside"
        rook = game.square_occupant(castle_row, 1)
        empty = game.square_occupant(castle_row, 2)
        if rook && rook.type == "Rook" && !rook.moved && empty.nil?
          return true
        end
      end
    end
    false
  end

  def castle_empty_space
    if castle_type == "kingside"
      return [castle_row, 6]
    else
      return [castle_row, 4]
    end
  end

  def castle_rook
    if castle_type == "kingside"
      return game.square_occupant(castle_row, 8)
    elsif castle_type == "queenside"
      return game.square_occupant(castle_row, 1)
    else
      return nil
    end
  end

  def castle_row
    if piece.side == "white"
      return 1
    else
      return 8
    end
  end

  def castle_type
    if distance == 2
      return "kingside"
    elsif distance == -2
      return "queenside"
    else
      return nil
    end
  end

  def direction
    if vertical_change == 0
      return "horizontal"
    elsif horizontal_change == 0
      return "vertical"
    elsif vertical_change == horizontal_change
      return "positive diagonal"
    elsif vertical_change == -horizontal_change
      return "negative diagonal"
    else
      return "invalid"
    end
  end

  def distance
    if direction == "horizontal"
      return to_column - piece.column
    else
      return to_row - piece.row
    end
  end

  def friendly_fire?
    if to_occupant && to_occupant.side == piece.side
      return true
    else
      return false
    end
  end

  def horizontal_change
    to_column - piece.column
  end

  def intermediate_pieces
    pieces = []
    intermediate_squares.each do |square|
      piece = Piece.where(game_id: game.id, row: square[0], column: square[1])[0]
      if piece
        pieces << piece
      end
    end
    pieces
  end

  def intermediate_squares
    min_row = [piece.row, to_row].min
    max_row = [piece.row, to_row].max
    min_column = [piece.column, to_column].min
    max_column = [piece.column, to_column].max
    squares = []
    if direction == "vertical"
      i = min_row + 1
      while i < max_row
        squares << [i, to_column]
        i += 1
      end
    elsif direction == "horizontal"
      i = min_column + 1
      while i < max_column
        squares << [to_row, i]
        i += 1
      end
    elsif direction == "positive diagonal"
      i = min_row + 1
      j = min_column + 1
      while i < max_row
        squares << [i, j]
        i += 1
        j += 1
      end
    elsif direction == "negative diagonal"
      i = min_row + 1
      j = max_column - 1
      while i < max_row
        squares << [i, j]
        i += 1
        j -= 1
      end
    end
    squares
  end

  def invalid_direction?
    if direction == "invalid" && piece.type != "Knight"
      return true
    else
      return false
    end
  end

  def legal?
    if invalid_direction? || blocked? || friendly_fire?
      return false
    else
      return true
    end
  end

  def pawn_promotion?
    if piece.type == "Pawn" && (piece.side == "white" && to_row == 8 || piece.side == "black" && to_row == 1)
      return true
    else
      return false
    end
  end

  def to_occupant
    Piece.where(game_id: game.id, row: to_row, column: to_column)[0]
  end

  def vertical_change
    to_row - piece.row
  end
end
